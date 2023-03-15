class Person {
  // Properties
  String? firstName;
  String? lastName;

  // Constructor
  Person(this.firstName, this.lastName);

  // Getter
  String get fullName => "$firstName $lastName";
}

// void main() {
//   Person p = Person("John", "Doe");
//   print(p.fullName);
// }

class NoteBook {
  // Private properties
  String _name;
  double _prize;

  // Constructor
  NoteBook(this._name, this._prize);

  // Getter to access private property _name
  String get name {
    if (_name == "") {
      return "No Name";
    }
    return this._name;
  }

  // Getter to access private property _prize
  double get prize {
    return this._prize;
  }
}

void main() {
  // Create an object of NoteBook class
  NoteBook nb = new NoteBook("Apple", 1000);
  print("First Notebook name: ${nb.name}");
  print("First Notebook prize: ${nb.prize}");
  NoteBook nb2 = new NoteBook("", 500);
  print("Second Notebook name: ${nb2.name}");
  print("Second Notebook prize: ${nb2.prize}");
}
