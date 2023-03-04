import 'package:flutter/rendering.dart';
import 'package:game/resources/socket_client.dart';

class SocketMethods {
  final _socketClinet = SocketClient.instance!.socket!;

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClinet.emit('createRoom', {'name': name});
    }
  }
}
