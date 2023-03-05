import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game/provider/room_data.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<RoomDataProvider>(context).player1.name);
    print(Provider.of<RoomDataProvider>(context).player2.name);
    return Scaffold(
      body: Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).player1.toString(),
        ),
      ),
    );
  }
}
