int square(int? value) {
  assert(value != null); // for debugging
  if (value == null) throw Exception();
  return value * value;
}

main() {
  print(square(4));
  var x = 100;

  // typeoff as in js
  if (x is int) {
    print("Integer");
  }
}
