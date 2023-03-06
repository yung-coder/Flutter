import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game/provider/room_data.dart';
import 'package:game/resources/socket_client.dart';
import 'package:game/screens/game.dart';
import 'package:game/utils/utils.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClinet = SocketClient.instance!.socket!;

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClinet.emit('createRoom', {'name': name});
    }
  }

  void joinRoom(String name, String roomId) {
    if (name.isNotEmpty && roomId.isNotEmpty) {
      _socketClinet.emit('joinRoom', {
        'name': name,
        'roomId': roomId,
      });
    }
  }

  void createRoomSuccessListner(BuildContext context) {
    _socketClinet.on('createRoomDone', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListner(BuildContext context) {
    _socketClinet.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListner(BuildContext context) {
    _socketClinet.on('errorOccured', (data) {
      showSnackBar(context, data);
    });
  }

  void updatePlayersStateListner(BuildContext context) {
    _socketClinet.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(playerData[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClinet.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }
}
