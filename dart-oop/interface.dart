// creating an interface using concrete class
class Laptop {
  // method
  turnOn() {
    print('Laptop turned on');
  }

  // method
  turnOff() {
    print('Laptop turned off');
  }
}

class MacBook implements Laptop {
  // implementation of turnOn()
  @override
  turnOn() {
    print('MacBook turned on');
  }

  // implementation of turnOff()
  @override
  turnOff() {
    print('MacBook turned off');
  }
}

// void main() {
//   var macBook = MacBook();
//   macBook.turnOn();
//   macBook.turnOff();
// }

// multiple inheritance

// abstract class as interface
abstract class Area {
  void area();
}

// abstract class as interface
abstract class Perimeter {
  void perimeter();
}

// implements multiple interfaces
class Rectangle implements Area, Perimeter {
  // properties
  int length, breadth;

  // constructor
  Rectangle(this.length, this.breadth);

// implementation of area()

  void area() {
    print('The area of the rectangle is ${length * breadth}');
  }

// implementation of perimeter()
  @override
  void perimeter() {
    print('The perimeter of the rectangle is ${2 * (length + breadth)}');
  }
}

void main() {
  Rectangle rectangle = Rectangle(10, 20);
  rectangle.area();
  rectangle.perimeter();
}
