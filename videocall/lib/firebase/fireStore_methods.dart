import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videocall/firebase/storage_methds.dart';
import 'package:videocall/models/livestream.dart';
import 'package:videocall/providers/user_provider.dart';
import 'package:videocall/utils/utiles.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageMethods _storageMethods = StorageMethods();

  Future<String> startLiveStream(
      BuildContext context, String title, Uint8List? image) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    String channelId = '';
    try {
      if (title.isNotEmpty && image != null) {
        if (!((await _firestore
                .collection('livestream')
                .doc('${user.user.uid}${user.user.username}')
                .get())
            .exists)) {
          String thumbnailUrl = await _storageMethods.uploadImageToStorage(
            'live-streamthumb',
            image,
            user.user.uid!,
          );
          channelId = '${user.user.uid}${user.user.username}';
          LiveStream liveStream = LiveStream(
            title: title,
            image: thumbnailUrl,
            uid: user.user.uid!,
            username: user.user.username!,
            viewers: 0,
            channelId: channelId,
            startedAt: DateTime.now(),
          );
          _firestore
              .collection('livestream')
              .doc(channelId)
              .set(liveStream.toMap());
        } else {
          showSnackBar(context, 'Two liveStream cannot start at same time');
        }
      } else {
        showSnackBar(context, 'Please enter all the fields');
      }
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }

    return channelId;
  }
}
