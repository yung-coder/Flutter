import 'package:flutter/material.dart';
import 'package:game/resources/game_methods.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void ShowGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      });
}
