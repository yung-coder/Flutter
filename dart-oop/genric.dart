// abstract class Shape
abstract class Shape {
  // abstract method area
  double get area;
}

// class Circle which implements Shape
class Circle implements Shape {
  // field radius
  final double radius;
  // constructor
  Circle(this.radius);

  // implementation of area method
  @override
  double get area => 3.14 * radius * radius;
}

// class Rectangle which implements Shape
class Rectangle implements Shape {
  // fields width and height
  final double width;
  final double height;
  // constructor
  Rectangle(this.width, this.height);

  // implementation of area method
  @override
  double get area => width * height;
}

// Generic class Region
class Region<T extends Shape> {
  // field shapes
  List<T> shapes;
  // constructor
  Region({required this.shapes});

  // method totalArea
  double get totalArea {
    double total = 0;
    shapes.forEach((shape) {
      total += shape.area;
    });
    return total;
  }
}

void main() {
  // create objects of Circle and Rectangle
  var circle = Circle(10);
  var rectangle = Rectangle(10, 20);
  // create a list of Shape objects
  var region = Region(shapes: [circle, rectangle]);
  // print the total area
  print("Total Area of Region: ${region.totalArea}");
}
