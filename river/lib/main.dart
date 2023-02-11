import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/Pages/home_page.dart';
import 'package:river/Pages/user.dart';

// Provider
// final nameProvider = Provider((ref) => "Chad");

//StateProvider

// final nameProvider = StateProvider<String?>((ref) => null);

// stateNotifier and StateNotifierProvider

final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier());

void main() {
  runApp(const ProviderScope(child: const MyApp()));
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
      home: MyHomePage(),
    );
  }
}
