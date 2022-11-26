void main() {
  // to include special symbols
  var s = r'In a raw string \n gets specail treatmnet';
  print(s);
  var  age = 30;
  // template literal type string in dart
  var str = 'Age: $age';
  print(str);

  //sting -> int
  var one = int.parse('2');
  assert(one == 1);

  // int -> string
  String oneString = 1.toString();
  assert(oneString == '1');


  // double -> string
  String decimalstring = 3.1231231.toStringAsFixed(2);
  assert(decimalstring == '3.12');

}