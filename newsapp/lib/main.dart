import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/Pages/ArticlePage.dart';
import 'package:newsapp/Pages/HomePage.dart';
import 'package:newsapp/model/Article.dart';
import 'package:newsapp/notifier/query.dart';

final queryProvider =
    StateNotifierProvider<QueryNoifier, Query>((ref) => QueryNoifier());

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
