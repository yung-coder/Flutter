import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/api.dart';
import 'package:newsapp/components/customtile.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/model/Article.dart';
import 'package:newsapp/notifier/query.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ApiService client = ApiService();
    final query = ref.watch(queryProvider) as Query;
    var art = client.article(query.q);
    print(query.q);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(children: [
        Center(
          child: TextField(
            onSubmitted: (value) {
              ref.read(queryProvider.notifier).updatequery(value);
            },
          ),
        ),
      ]),
    );
  }
}
