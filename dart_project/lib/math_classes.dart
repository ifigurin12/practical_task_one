import 'dart:math';

int gcdFunction(int a, int b) {
  return b > 0 ? gcdFunction(b, a % b) : a;
}

int lcmFunction(int a, int b) {
  return (a * b) ~/ gcdFunction(a, b);
}

int secondDegreeToTenth(int number) {
  int count = 0, resultValue = 0;

  while (number > 0) {
    resultValue += (number % 10) * (pow(2, count).toInt());
    number = number ~/ 10;
    count++;
  }
  return resultValue;
}

List<bool> tenthDegreeToSecond(int number) {
  List<bool> tempValueList = [];
  while (number > 0) {
    if (number % 2 == 0) {
      tempValueList.add(false);
    } else {
      tempValueList.add(true);
    }
    number ~/= 2;
  }
  List<bool> resultValueList = tempValueList.reversed.toList();
  return resultValueList;
}

List<num> numbersInString(String inputString) {
  List<String> splitString = inputString.split(' ');
  List<num> resultList = [];
  for (String item in splitString) {
    if (num.tryParse(item) != null) {
      resultList.add(num.parse(item));
    }
  }
  return resultList;
}

Map<String, int> countWordInStringList(List<String> inputStringList) {
  Map<String, int> resultMap = {};
  int count = 0;
  for (int i = 0; i < inputStringList.length; i++) {
    count = 1;
    if (!resultMap.containsKey(inputStringList[i])) {
      for (int j = i + 1; j < inputStringList.length - 1; j++) {
        if (inputStringList[i] == inputStringList[j]) {
          count++;
        }
      }
      resultMap[inputStringList[i]] = count;
    }
  }
  return resultMap;
}

class Point {
  double xCoords;
  double yCoords;
  double zCoords;

  Point(this.xCoords, this.yCoords, this.zCoords);

  factory Point.coordStart() {
    return Point(0, 0, 0);
  }

  factory Point.singleVector() {
    return Point(1, 1, 1);
  }

  factory Point.plusOnePoint(Point point) {
    return Point(point.xCoords + 1, point.yCoords + 1, point.zCoords + 1);
  }

  double distanceTo(Point another) {
    return sqrt(pow(xCoords - another.xCoords, 2) +
        pow(yCoords - another.yCoords, 2) +
        pow(zCoords - another.zCoords, 2));
  }

  double vectorABS() {
    return sqrt(pow(xCoords, 2) + pow(yCoords, 2) + pow(zCoords, 2));
  }

  Point vectorMultiple(Point pointTwo) {
    double x = yCoords * pointTwo.zCoords - zCoords * pointTwo.yCoords;
    double y = -(xCoords * pointTwo.zCoords - zCoords * pointTwo.xCoords);
    double z = xCoords * pointTwo.yCoords - yCoords * pointTwo.xCoords;
    return Point(x, y, z);
  }

  double areaOfTriangle(Point pointTwo, Point pointThree) {
    Point vectorOne = Point(pointTwo.xCoords - xCoords,
        pointTwo.yCoords - yCoords, pointTwo.zCoords - zCoords);
    Point vectorTwo = Point(pointThree.xCoords - xCoords,
        pointThree.yCoords - yCoords, pointThree.zCoords - zCoords);
    return 0.5 * vectorOne.vectorMultiple(vectorTwo).vectorABS();
  }
}

extension on num {
  num rootOfNewton(int degree)
  {
   num eps = 0.0001;
   num prevY, nextY;
 
   nextY = this;
   do
   {
      prevY = nextY;
      nextY = (prevY*(degree - 1) + this / prevY.introductionToDegree(degree - 1)) / degree;
   }while ((nextY - prevY).numberAbs() > eps);
      return nextY;
  }
}
extension on num {
  num introductionToDegree(int degree){
    num result = this;
    for (int i = 0; i < degree; i++)
    {
      result *= this;
    }
    return result;
  }
}

extension on num {
  num numberAbs(){
    if (this > 0) 
    {
      return this;
    }
    else 
    {
      return -this;
    }
  }
}