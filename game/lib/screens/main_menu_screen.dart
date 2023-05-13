import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game/responsive/responsive.dart';
import 'package:game/screens/create_room_screen.dart';
import 'package:game/screens/join_room_screen.dart';
import 'package:game/widgets/Custom_button.dart';

class MainMenu extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, CreateRoomScreen.routeName);
                },
                text: 'Make Room'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onTap: () {
               Navigator.pushNamed(context, JoinRoomScreen.routeName);
            }, text: 'Join Room'),
          ],
        ),
      ),
    );
  }
}
