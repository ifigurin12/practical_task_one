import 'package:dart_project/math_classes.dart';


void main(List<String> arguments) 
{
  int a = 15, b = 20; 
  print(gcdFunction(a, b));
  print(lcmFunction(50, 175));
  print(secondDegreeToTenth(1010010));
  print(tenthDegreeToSecond(82)); // В dart нету типа byte, поэтому вывожу как список логических значений
  String forCheckNextMethod = '1 2 3 cat dog 2 4 bad worse next 13.4';
  print(numbersInString(forCheckNextMethod));
  List<String> example = ['11', '11', '21', 'cat', 'cat', '714'];
  print(countWordInStringList(example));
  Point p1 = Point(-2, 1, 2); 
  print(p1.distanceTo(Point(1, 2, 3)));
  print(p1.areaOfTriangle(Point(3, -3, 4), Point(1, 0, 9)));
  num exampleNum = 13; 
}

