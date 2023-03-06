import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game/provider/room_data.dart';
import 'package:game/resources/socket_methods.dart';
import 'package:game/views/game_board.dart';
import 'package:game/views/scoreboard.dart';
import 'package:game/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListner(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    print(Provider.of<RoomDataProvider>(context).player1.name);
    print(Provider.of<RoomDataProvider>(context).player2.name);
    return Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ScoreBoard(),
                    TicTacToeBoard(),
                    Text(
                      '${roomDataProvider.roomData['turn']['name']}\'s turn',
                    ),
                  ],
                ),
              ));
  }
}
