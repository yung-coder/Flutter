import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game/resources/socket_client.dart';
import 'package:game/screens/game.dart';

class SocketMethods {
  final _socketClinet = SocketClient.instance!.socket!;

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClinet.emit('createRoom', {'name': name});
    }
  }

  void createRoomSuccessListner(BuildContext context) {
    _socketClinet.on('createRoomDone', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
