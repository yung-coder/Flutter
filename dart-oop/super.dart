// class Laptop {
//   // Method
//   void show() {
//     print("Laptop show method");
//   }
// }

// class MacBook extends Laptop {
//   void show() {
//     super.show(); // Calling the show method of the parent class
//     print("MacBook show method");
//   }
// }

// void main() {
//   // Creating an object of the MacBook class
//   MacBook macbook = MacBook();
//   macbook.show();
// }

class Employee {
  // Constructor
  Employee(String name, double salary) {
    print("Employee constructor");
    print("Name: $name");
    print("Salary: $salary");
  }
}

class Manager extends Employee {
  // Constructor
  Manager(String name, double salary) : super(name, salary) {
    print("Manager constructor");
  }
}

void main() {
  Manager manager = Manager("John", 25000.0);
}
