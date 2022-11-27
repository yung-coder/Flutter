class Person {
  final name;
  static const int age = 14;

  Person(this.name);
  // late String name;
  // late int age;

  // Person(String name, [int age = 18]) {
  //   this.name = name;
  //   this.age = age;
  // }

  // //named constructor
  // Person.guest() {
  //   name = 'Guest';
  //   age = 67;
  // }

  // void showOutput() {
  //   print(name);
  //   print(age);
  // }
}

main() {
  // Person person1 = Person('sak', 89);
  // person1.showOutput();

  // var person2 = Person.guest();
  // person2.showOutput();
  var x = Person('Pablo');
  print(x.name);
}
