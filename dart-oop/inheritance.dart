// class Person {
//   // Properties
//   String? name;
//   int? age;

//   // Method
//   void display() {
//     print("Name: $name");
//     print("Age: $age");
//   }
// }

// // Here In student class, we are extending the
// // properties and methods of the Person class
// class Student extends Person {
//   // Fields
//   String? schoolName;
//   String? schoolAddress;

//   // Method
//   void displaySchoolInfo() {
//     print("School Name: $schoolName");
//     print("School Address: $schoolAddress");
//   }
// }

// void main() {
//   // Creating an object of the Student class
//   var student = Student();
//   student.name = "John";
//   student.age = 20;
//   student.schoolName = "ABC School";
//   student.schoolAddress = "New York";
//   student.display();
//   student.displaySchoolInfo();
// }

class Person {
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);
}

class Student extends Person {
  int rollNumber;
  // super is used to refer parent class 
  // Constructor
  Student(String name, int age, this.rollNumber) : super(name, age);
}

void main() {
  var student = Student("John", 20, 1);
  print("Student name: ${student.name}");
  print("Student age: ${student.age}");
  print("Student roll number: ${student.rollNumber}");

}
