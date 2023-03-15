// Parametrized constructor with Named Parameters in Dart

class Student {
  int? id;
  String? name;
  int? roolNo;
  String? school;

  Student({this.id, this.name, this.roolNo, this.school = "XYZ"});

  void display() {
    print("Id is $id");
    print("name is $name");
    print("Roll no  is $roolNo");
    print("School  is $school");
  }
}

// void main() {
//   Student s = Student(id: 1, name: "Jack", roolNo: 1, school: "XYZ ");
//   s.display();
// }

// Named constructor

class Add {
  int? n1;
  int? n2;
  int? n3;
  Add(this.n1, this.n2);

  Add.add3(this.n1, this.n2, this.n3);

  void display() {
    if (n3 == null) {
      n3 = 0;
    }
    int sum = n1! + n2! + n3!;
    print("sum is $sum");
  }
}

// void main() {
//   Add a = Add.add3(10, 20 , 10);
//   a.display();
// }

// Constant

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

void main() {
  // p1 and p2 has the same hash code.
  Point p1 = const Point(1, 2);
  print("The p1 hash code is: ${p1.hashCode}");

  Point p2 = const Point(1, 2);
  print("The p2 hash code is: ${p2.hashCode}");
  // without using const
  // this has different hash code.
  Point p3 = Point(2, 2);
  print("The p3 hash code is: ${p3.hashCode}");

  Point p4 = Point(2, 2);
  print("The p4 hash code is: ${p4.hashCode}");
}
