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

void main() {
  Add a = Add.add3(10, 20 , 10);
  a.display();
}
