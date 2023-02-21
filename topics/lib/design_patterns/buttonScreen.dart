import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:topics/design_patterns/flutter_factory.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlatfromButton(TargetPlatform.android).build(() {
            print('Its samsung');
          }, const Text('Click')),
          PlatfromButton(TargetPlatform.iOS).build(() {
            print('Its Iphone');
          }, const Text('Click'))
        ],
      ),
    );
  }
}
