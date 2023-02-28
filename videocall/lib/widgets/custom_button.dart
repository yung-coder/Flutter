// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:videocall/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
