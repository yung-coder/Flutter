import 'package:flutter/material.dart';
import 'package:topics/design_patterns/buttonScreen.dart';
import 'package:topics/design_patterns/dart_method.dart';
import 'package:topics/futures/future_ex.dart';

void main() {
  Employee employee = Employee('hr');
  employee.work();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButtonScreen(),
    );
  }
}
