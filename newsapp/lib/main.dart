import 'package:flutter/material.dart';
import 'package:newsapp/Pages/ArticlePage.dart';
import 'package:newsapp/Pages/HomePage.dart';
import 'package:newsapp/model/Article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
