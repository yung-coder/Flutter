import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyStateFullWidget extends StatefulWidget {
  const MyStateFullWidget({super.key});

  
  @override
  State<MyStateFullWidget> createState() => _MyStateFullWidgetState();
}

class _MyStateFullWidgetState extends State<MyStateFullWidget> {
  late int ab;

  @override
  void initState() {
    super.initState();
    ab = 10;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text(ab.toString()),
       ),
    );
  }
}