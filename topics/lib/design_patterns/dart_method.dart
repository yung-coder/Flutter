abstract class Employee {
  void work();
  // method  1
  factory Employee(String type) {
    switch (type) {
      case 'programmer':
        return Programmer();
      case 'hr':
        return HR();
      case 'boss':
        return Boss();
      default:
        return Programmer();
    }
  }
}

class Programmer implements Employee {
  @override
  void work() {
    print('Code it out ');
  }
}

class HR implements Employee {
  @override
  void work() {
    print('recurit');
  }
}

class Boss implements Employee {
  @override
  void work() {
    print('Lead');
  }
}

// method 2

class FactoryMethod {
  static Employee getEmployee(String type) {
    switch (type) {
      case 'programmer':
        return Programmer();
      case 'hr':
        return HR();
      case 'boss':
        return Boss();
      default:
        return Programmer();
    }
  }
}
