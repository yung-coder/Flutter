// main() {
//   showit(square(21));
// }

// dynamic square(num) {
//   return num + num;
// }

// void showit(var msg) {
//   print(msg);
// }

void main() {
  print(sum(10));
}

dynamic sum(var num1, {var num2}) => num1 + (num2 ?? 0);
