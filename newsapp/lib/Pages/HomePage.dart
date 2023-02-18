import 'package:flutter/material.dart';
import 'package:newsapp/api.dart';
import 'package:newsapp/components/customtile.dart';
import 'package:newsapp/model/Article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
  ApiService client = ApiService();
  client.article();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
