import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/Pages/Future_page.dart';
import 'package:river/Pages/home_page.dart';
import 'package:river/Pages/user.dart';
import 'package:http/http.dart' as http;
import 'package:river/Pages/user_api.dart';

// Provider
// final nameProvider = Provider((ref) => "Chad");

//StateProvider

// final nameProvider = StateProvider<String?>((ref) => null);

// stateNotifier and StateNotifierProvider --- main one

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

// changeNotifierProvider -- mutable not good!

final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

// Future Providers

final fetchUserProvider = FutureProvider((ref) {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  return http.get(Uri.parse(url)).then((value) => UserE.fromJson(value.body));
});

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
      home: MyWidget(),
    );
  }
}
