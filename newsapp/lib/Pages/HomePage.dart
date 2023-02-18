import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/api.dart';
import 'package:newsapp/state/Article.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  ApiService client = ApiService();

  @override
  void initState() {
    upadater();
    super.initState();
  }

  upadater() {
    final article = ref.watch(ArticlesProvider) as Article;
    var articles = client.article();

    ref.read(ArticlesProvider.notifier).updateState(articles as Article);
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
       body: Column(
         children: [
            Center(
               child: Text(),
            )
         ],
       ),
    );
  }
}
