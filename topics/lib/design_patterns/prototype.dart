// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String name;
  String lastname;
  int age;
  Person({
    required this.name,
    required this.lastname,
    required this.age,
  });

  Person clone() => Person(name: name, lastname: lastname, age: age);
}

Person person = Person(name: 'Saksham', lastname: 'Chandel', age: 20);
Person person1 = person.clone();
