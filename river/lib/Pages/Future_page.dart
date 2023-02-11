import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/Pages/user_api.dart';
import 'package:river/main.dart';

class MyStateHome extends ConsumerStatefulWidget {
  const MyStateHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyStateHomeState();
}

class _MyStateHomeState extends ConsumerState<MyStateHome> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userNo));

    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) => setState(() {
                  userNo = value;
                }),
              ),
              Center(
                child: Text(data.name),
              )
            ],
          ),
        );
      },
      error: ((error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
      }),
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // return ref.watch(streamProvider).when(data: (data) {
    //   return Text(data.toString());
    // }, error: (error, stackTrace) {
    //   return Scaffold(
    //     body: Center(
    //       child: Text(
    //         error.toString(),
    //       ),
    //     ),
    //   );
    // }, loading: () {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // });
  }
}

// class MyWidget extends ConsumerWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(fetchUserProvider);

//     return user.when(
//       data: (data) {
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               TextField(),
//               Center(
//                 child: Text(data.name),
//               )
//             ],
//           ),
//         );
//       },
//       error: ((error, stackTrace) {
//         return Scaffold(
//           body: Center(
//             child: Text(
//               error.toString(),
//             ),
//           ),
//         );
//       }),
//       loading: () {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     // return ref.watch(streamProvider).when(data: (data) {
//     //   return Text(data.toString());
//     // }, error: (error, stackTrace) {
//     //   return Scaffold(
//     //     body: Center(
//     //       child: Text(
//     //         error.toString(),
//     //       ),
//     //     ),
//     //   );
//     // }, loading: () {
//     //   return const Center(
//     //     child: CircularProgressIndicator(),
//     //   );
//     // });
//   }
// }
