// class Cat {
//   final String name;
//   Cat(this.name);
// }

// extension Run on Cat {
//   void run() {
//     print('Cat $name is running');
//   }
// }

Iterable<int> getcount() sync* {
  yield 1;
  yield 2;
  yield 3;
}

Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return 'Foo';
  });
}

Future<int> heavyfutureThatMultifliesByTwo(int a) {
  return Future.delayed(const Duration(seconds: 3), () => a * 2);
}

void test() async {
  // await for (final value in getName()) {
  //   print(value);
  // }
  // print('Stream over');
  for (final value in getcount()) {
    print(value);
  }
  // final result = await heavyfutureThatMultifliesByTwo(2);
  // print(result);
}

main() {
  test();
  // final meow = Cat('Pussy');
  // meow.run();
  // print(meow.name);
}
