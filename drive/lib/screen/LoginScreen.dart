import 'package:drive/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            'assests/images/g-logo-2.png',
            height: 20,
          ),
          label: const Text(
            'Sign in with google',
            style: TextStyle(
              color: KBlackColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 50), backgroundColor: KWhiteColor),
        ),
      ),
    );
  }
}
