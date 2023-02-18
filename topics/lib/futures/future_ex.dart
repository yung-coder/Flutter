import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:topics/futures/second_page.dart';

// ignore: camel_case_types
class futurex extends StatefulWidget {
  const futurex({super.key});

  @override
  State<futurex> createState() => _futurexState();
}

class _futurexState extends State<futurex> {
  List UserList = [];
  
  @override
  void initState() {
    getStudentDetalis();
    // delayTrans();
    // CustomFuture();
    super.initState();
  }

  // CustomFuture() {
  //   Future future = Future(() {
  //     print('Whats a future');
  //   });

  //   // future.then((value) => print(value));

  //   // Future.error(throw Exception('Some  internal  error ocured'));

  //   // directly getting the value
  //   Future.value(future);
  // }

  // delayTrans() async {
  //   await Future.delayed(Duration(seconds: 2), () {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => const SecondPage()));
  //   });
  // }

  Future<List> getStudentDetalis() async {
    const url = 'https://jsonplaceholder.typicode.com/users';

    // method -1
    // http
    //     .get(Uri.parse(url))
    //     .then((value) => print(value.body))
    //     .catchError((err) => print(err.toString()));

    // method -2
    try {
      http.Response res = await http.get(Uri.parse(url));
      var body = jsonDecode(res.body);
      for (var user in body) {
        UserList.add(user['name']);
      }
    } catch (e) {
      print(e.toString());
    }

    return UserList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getStudentDetalis(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return ListTile(
                      title: Text(data),
                      leading: Text('${index}'),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
