import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider) ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              final name =
                  ref.read(nameProvider.notifier).update((state) => value);
            },
          ),
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
