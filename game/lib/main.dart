import 'package:flutter/material.dart';
import 'package:game/provider/room_data.dart';
import 'package:game/screens/create_room_screen.dart';
import 'package:game/screens/game.dart';
import 'package:game/screens/join_room_screen.dart';
import 'package:game/screens/main_menu_screen.dart';
import 'package:game/utils/Colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          MainMenu.routeName: (context) => const MainMenu(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
        initialRoute: MainMenu.routeName,
        home: MainMenu(),
      ),
    );
  }
}
