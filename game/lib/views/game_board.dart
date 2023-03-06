import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:game/provider/room_data.dart';
import 'package:game/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();

  tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(index, roomDataProvider.roomData['_id'],
        roomDataProvider.displayElements);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.tappedListner(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => tapped(index, roomDataProvider),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: Center(
                child: Text(
                  roomDataProvider.displayElements[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      shadows: [
                        Shadow(
                          blurRadius: 40,
                          color: roomDataProvider.displayElements[index] == 'O'
                              ? Colors.red
                              : Colors.blue,
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
