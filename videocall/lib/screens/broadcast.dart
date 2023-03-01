import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocall/config/appid.dart';

class BroadCastScreen extends StatefulWidget {
  const BroadCastScreen({super.key});

  @override
  State<BroadCastScreen> createState() => _BroadCastScreenState();
}

class _BroadCastScreenState extends State<BroadCastScreen> {
  late final RtcEngine _engine;
  @override
  void initState() {
    // TODO: implement initState
    _initEngine();

    super.initState();
  }

  void _initEngine() async {}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
