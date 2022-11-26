main() {
  // lsit is equal to an array
  List names = ['jack', 'Peil', 123, 34.56, false];

  // same as js
  List names2 = [...names];

  names[1] = 'Mark';

  for (var n in names2) {
    print(n);
  }
}
