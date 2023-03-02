// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocall/utils/colors.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onTap;
  const CustomTextFiled({Key? key, required this.controller, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: onTap,
        controller: controller,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryBackgroundColor,
            ),
          ),
        ));
  }
}
