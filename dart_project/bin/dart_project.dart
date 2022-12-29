import 'package:dart_project/math_classes.dart' as math;

void main(List<String> arguments) {
  int a = 15, b = 20; 
  print(math.gcdFunction(a, b));
  print(math.lcmFunction(50, 175));
  print(math.secondDegreeToTenth(1010010));
  print(math.tenthDegreeToSecond(82)); // В dart нету типа byte, поэтому вывожу как список логических значений
  String forCheckNextMethod = '1 2 3 cat dog 2 4 bad worse next 13.4';
  print(math.numbersInString(forCheckNextMethod));
  List<String> example = ['11', '11', '21', 'cat', 'cat', '714'];
  print(math.countWordInStringList(example));
}
