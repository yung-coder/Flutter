class Simple {
  static String planet = "Earth";
}

// void main() {
//   print(Simple.planet);
// }

class Employee {
  // Static variable
  static int count = 0;
  // Constructor
  Employee() {
    count++;
  }
  // Method to display the value of count
  void totalEmployee() {
    print("Total Employee: $count");
  }
}

// void main() {
//   // Creating objects of Employee class
//   Employee e1 = new Employee();
//   e1.totalEmployee();
//   Employee e2 = new Employee();
//   e2.totalEmployee();
//   Employee e3 = new Employee();
//   e3.totalEmployee();
// }

// Static method in dart

class SimpleInterest {
  static double calculateInterest(double principal, double rate, double time) {
    return (principal * rate * time) / 100;
  }
}

void main() {
  print(
      "The simple interest is ${SimpleInterest.calculateInterest(1000, 2, 2)}");
}
