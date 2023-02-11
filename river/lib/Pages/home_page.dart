import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/Pages/user.dart';
import 'package:river/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider) ?? '';

    final user = ref.watch(userProvider) as User;

    // specfic rerun of widget on a value
    // final user = ref.watch(userProvider.select((value) => value.name));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              ref.read(userProvider.notifier).updateName(value);
            },
          ),
          TextField(
            onSubmitted: (value) {
              ref.read(userProvider.notifier).updateAge(int.parse(value));
            },
          ),
          Center(
            child: Column(
              children: [
                Text(user.name),
                Text(user.age.toString()),
                // Text(user.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
