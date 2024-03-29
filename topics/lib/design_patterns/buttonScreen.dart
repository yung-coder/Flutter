import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:topics/design_patterns/adaptar.dart';
import 'package:topics/design_patterns/flutter_factory.dart';
import 'package:topics/design_patterns/platform_abstract_factory.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final PostAPI postAPI = PostAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PlatfromButton(TargetPlatform.android).build(() {
          //   print('Its samsung');
          // }, const Text('Click')),
          // PlatfromButton(TargetPlatform.iOS).build(() {
          //   print('Its Iphone');
          // }, const Text('Click'))

          // AbstractFactoryimp().buildButton(context, 'click', () {}),
          // const SizedBox(
          //   height: 10,
          // ),
          // AbstractFactoryimp().buildIndicator(context),

          // AbstractFactoryimp.instance.buildIndicator(context),
          Expanded(
            child: ListView.builder(
              itemCount: postAPI.getPosts().length,
              itemBuilder: (context, index) {
                final posts = postAPI.getPosts()[index];
                return ListTile(
                  title: Text(posts.title),
                  subtitle: Text(posts.bio),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
