import 'package:ai/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistant'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20).copyWith(
                    topLeft: Radius.zero,
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'GPT here for you !',
                  style: TextStyle(
                    color: Pallete.mainFontColor,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
              top: 10,
              left: 0,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Few Features',
              style: TextStyle(
                  color: Pallete.mainFontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
