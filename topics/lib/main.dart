import 'package:flutter/material.dart';
import 'package:topics/design_patterns/buttonScreen.dart';
import 'package:topics/design_patterns/dart_method.dart';
import 'package:topics/design_patterns/singleton1.dart';
import 'package:topics/design_patterns/singleton2.dart';
import 'package:topics/design_patterns/singleton3.dart';
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
    Singleton3 singleton5 = Singleton3();
    Singleton2 singleton1 = Singleton2.instance;
    Singleton1 singleton6 = Singleton1.getInstance();
    Singleton1 singleton2 = Singleton1.getInstance();
    Singleton1 singleton3 = Singleton1.getInstance();
    Singleton1 singleton4 = Singleton1.getInstance();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButtonScreen(),
    );
  }
}
