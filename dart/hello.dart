import 'dart:io';

main() {
  stdout.writeln('Whats your name: ?');
  String? name = stdin.readLineSync();
  print('My name is $name');

  // to behave like javascript 
  dynamic change = 100;
  print(change);

  change = 'Columbian';
  print(change);

  change = null;
  print(null);
}
