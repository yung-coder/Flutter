import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/Pages/user_api.dart';
import 'package:river/main.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    // return user.when(
    //   data: (data) {
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Column(
    //         children: [
    //           Center(
    //             child: Text(data.name),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    //   error: ((error, stackTrace) {
    //     return Scaffold(
    //       body: Center(
    //         child: Text(
    //           error.toString(),
    //         ),
    //       ),
    //     );
    //   }),
    //   loading: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    return ref.watch(streamProvider).when(data: (data) {
      return Text(data.toString());
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(
            error.toString(),
          ),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
