import 'package:cart/pages/HomePage.dart';
import 'package:cart/pages/Login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/" :  (context) => LoginPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
