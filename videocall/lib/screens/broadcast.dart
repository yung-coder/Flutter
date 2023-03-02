// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:videocall/config/appid.dart';
import 'package:videocall/firebase/fireStore_methods.dart';
import 'package:videocall/providers/user_provider.dart';
import 'package:videocall/screens/home_screen.dart';
import 'package:videocall/widgets/chat.dart';
import 'package:http/http.dart' as http;

class BroadCastScreen extends StatefulWidget {
  final bool isBroadcaster;
  final String channdelId;
  const BroadCastScreen({
    Key? key,
    required this.isBroadcaster,
    required this.channdelId,
  }) : super(key: key);

  @override
  State<BroadCastScreen> createState() => _BroadCastScreenState();
}

class _BroadCastScreenState extends State<BroadCastScreen> {
  late final RtcEngine _engine;
  List<int> remoteUid = [];
  bool switchCamera = true;
  bool isMuted = false;

  @override
  void initState() {
    // TODO: implement initState
    _initEngine();

    super.initState();
  }

  void _initEngine() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    _addListners();

    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    if (widget.isBroadcaster) {
      _engine.setClientRole(ClientRole.Broadcaster);
    } else {
      _engine.setClientRole(ClientRole.Audience);
    }

    _joinChannel();
  }

  String baseUrl = "https://go-server-7l7r.onrender.com";
  String? token;

  Future<void> getToken() async {
    final res = await http.get(
      Uri.parse(baseUrl +
          '/rtc/' +
          widget.channdelId +
          'publisher/userAccount' +
          Provider.of<UserProvider>(context, listen: false).user.uid! +
          '/'),
    );

    if (res.statusCode == 200) {
      setState(() {
        token = res.body;
        token = jsonDecode(token!)['rtcToken'];
      });
    } else {
      print("Failed to fetch");
    }
  }

  void _addListners() async {
    _engine.setEventHandler(
      RtcEngineEventHandler(joinChannelSuccess: (channel, uid, elasped) {
        print('JoinedChannelSucess $channel $uid $elasped');
      }, userJoined: (uid, elapsed) {
        print('userJoined $uid $elapsed');
        setState(() {
          remoteUid.add(uid);
        });
      }, userOffline: (uid, reason) {
        print('userOffline $uid $reason');
        setState(() {
          remoteUid.removeWhere((element) => element == uid);
        });
      }, leaveChannel: (stats) {
        print('leaveChannel $stats');
        setState(() {
          remoteUid.clear();
        });
      }, tokenPrivilegeWillExpire: (token) async {
        await getToken();
        await _engine.renewToken(token);
      }),
    );
  }

  void _joinChannel() async {
    await getToken();
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }

    await _engine.joinChannelWithUserAccount(
      token,
      widget.channdelId,
      Provider.of<UserProvider>(context, listen: false).user.uid!,
    );
  }

  void _switchCamera() {
    _engine.switchCamera().then((value) {
      setState(() {
        switchCamera = !switchCamera;
      });
    }).catchError((e) => {print('$e ')});
  }

  void onToogleMute() async {
    setState(() {
      isMuted = !isMuted;
    });
    await _engine.muteLocalAudioStream(isMuted);
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
    if ('${Provider.of<UserProvider>(context, listen: false).user.uid}${Provider.of<UserProvider>(context, listen: false).user.username}' ==
        widget.channdelId) {
      await FireStoreMethods().endLiveStream(widget.channdelId);
    } else {
      await FireStoreMethods().updateViewCount(widget.channdelId, false);
    }
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return WillPopScope(
      onWillPop: () async {
        await _leaveChannel();
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                children: [
                  _renderVideo(user),
                  if ("${user.uid}${user.username}" == widget.channdelId)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: _switchCamera,
                            child: const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
                              child: Icon(Icons.sync)
                            )),
                        InkWell(
                          onTap: onToogleMute,
                          child: Text(isMuted ? 'Unmute' : "Mute"),
                        )
                      ],
                    ),
              Expanded(
                child: Chat(
                  channelId: widget.channdelId,
                ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _renderVideo(user) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: "${user.uid}${user.username}" == widget.channdelId
          ? const RtcLocalView.SurfaceView(
              zOrderMediaOverlay: true,
              zOrderOnTop: true,
            )
          : remoteUid.isNotEmpty
              ? kIsWeb
                  ? RtcRemoteView.SurfaceView(
                      uid: remoteUid[0],
                      channelId: widget.channdelId,
                    )
                  : RtcRemoteView.TextureView(
                      uid: remoteUid[0],
                      channelId: widget.channdelId,
                    )
              : Container(),
    );
  }
}
