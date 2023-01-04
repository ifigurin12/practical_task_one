import 'dart:math';

class DelimetersCalculator {  // 1.1 НОД и НОК

  static int greatestCommonDivider(int numberOne, int numberTwo) {
    return _absForGcd(numberTwo) != 0 ? greatestCommonDivider(numberTwo, numberOne % numberTwo) : numberOne;
  }

  static int _absForGcd(int number) {
    return number > 0 ? number : -number;
  }

  static int leastCommonMultiple(int numberOne, int numberTwo) {
    return numberOne ~/ greatestCommonDivider(numberOne, numberTwo) * numberTwo;
  }
}

class NumberFactorization { // 1.2 Простые множители
  int numberForFactorization;

  NumberFactorization(this.numberForFactorization) {
    if (numberForFactorization <= 0) {
      throw ArgumentError('The entered number is not natural');
    }
  }
  List<int> numberFactorization() {
    int numberForChange = numberForFactorization;
    List<int> resultValues = [];
    int div = 2;
    while (numberForChange > 1) {
      while (numberForChange % div == 0) {
        resultValues.add(div);
        numberForChange ~/= div;
      }
      div++;
    }
    return resultValues;
  }
}

class BinaryAndDecimal {  // 2 Из двоичной в десятичную и обратно 
  static int binaryToDecimal(String binaryNumber) {
    int count = 0, resultValue = 0;
    int number;
    if (int.tryParse(binaryNumber) == null) {
      throw ArgumentError('Your string is not a numbers');
    } else {
      for (int index = 0; index < binaryNumber.length; index++) {
        if (binaryNumber[index] != '1' && binaryNumber[index] != '0') {
          throw ArgumentError('Your string is not a binary');
        }
      }
      number = int.parse(binaryNumber);
      while (number > 0) {
        resultValue += (number % 10) * (pow(2, count).toInt());
        number = number ~/ 10;
        count++;
      }
      return resultValue;
    }
  }

  static String decimalToBinary(int number) {   
    List<String> tempValueList = [];
    while (number != 0) {
      if (number % 2 == 0) {
        number > 0 ? tempValueList.add('0') : tempValueList.add('1');
      } else {
        number > 0 ? tempValueList.add('1') : tempValueList.add('0');
      }
      number ~/= 2;
    }
    List<String> preResultValueList = tempValueList.reversed.toList();
    String result = '';
    for(int i = 0; i < preResultValueList.length - 1; i++) 
    {
      result += preResultValueList[i];
    }
    return number > 0 ? result += preResultValueList[preResultValueList.length - 1] : result += '1';
  }
}

class StringAndWords {    
  static const List<String> equalValues = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];


  // Return all numbers in lines 
  static List<num> numbersPerLines(String inputString) { 
    if (inputString.isEmpty) {
      throw ArgumentError('Your string list is empty');
    }
    List<String> splitString = inputString.split(' ');
    List<num> resultList = [];
    for (String item in splitString) {
      if (num.tryParse(item) != null) {
        resultList.add(num.parse(item));
      }
    }
    return resultList;
  }
  // Return number of occurrences of words in a sentence
  static Map<String, int> countWordInStringList(List<String> words) {  
    Map<String, int> resultMap = {};
    int count = 0;
    for (int i = 0; i < words.length; i++) {
      count = 1;
      if (!resultMap.containsKey(words[i])) {
        for (int j = i + 1; j < words.length - 1; j++) {
          if (words[i] == words[j]) {
            count++;
          }
        }
        resultMap[words[i]] = count;
      }
    }
    return resultMap;
  }
  
  // Returns numbers in list with no repeat (5 ex)
  static List<int> numbersFromStringToInt(List<String> words) {  
    List<int> resultNumbers = [];

    for (String word in words) {
      if (equalValues.contains(word) && !resultNumbers.contains(equalValues.indexOf(word))) {
        resultNumbers.add(equalValues.indexOf(word));
      }
    }
    return resultNumbers;
  }


}

class Point { 
  // 6 задание с точками            
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
    return Point(point.xCoords++, point.yCoords++, point.zCoords++);
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

class RootDegree {
  num numberForCalc;
  int degreeOfRoot;

  RootDegree(this.numberForCalc, this.degreeOfRoot) {
    if (numberForCalc < 0 && degreeOfRoot % 2 == 0) {
      throw ArgumentError('Your enter negative number in even degree');
    }
  }

  num calcRootValueInDegree() {
    return numberForCalc._rootOfNDegree(degreeOfRoot);
  }
}

extension on num {
  num _rootOfNDegree(int degree) {
    num eps = 0.00000001;
    num xPrev, xNext;

    xNext = this / degree;
    do {
      xPrev = xNext;
      xNext = (1 / degree) *
          ((degree - 1) * xPrev + (this / xPrev._leftToRightPow(degree - 1)));
    } while ((xNext - xPrev)._numberAbs() >= eps);
    return xNext;
  }
}

extension on num {
  num _leftToRightPow(int degree) {
    List<int> binaryMCoef = [];
    List<String> tempBinaryValues = BinaryAndDecimal.decimalToBinary(degree).split('');
    num resultValues = 1;
    for (int i = 0; i < tempBinaryValues.length; i++) {
      binaryMCoef.add(int.parse(tempBinaryValues[i]));
    }
    for (int i = 0; i < binaryMCoef.length; i++) {
      if (binaryMCoef[i] == 1) {
        resultValues = resultValues._raisingToSecDegree();
        resultValues *= this;
      } else {
        resultValues = resultValues._raisingToSecDegree();
      }
    }
    return resultValues;
  }
}

extension on num {
  num _raisingToSecDegree() {
    return this * this;
  }
}

extension on num {
  num _numberAbs() {
    if (this > 0) {
      return this;
    } else {
      return -this;
    }
  }
}


class User { // 8 
  late String email;

  User(String email) {
    if (email.contains('@')) {
      if (email.substring(email.indexOf('@'), email.length).contains('.') &&
          email.substring(email.indexOf('@'), email.length).length > 5) {
        this.email = email;
      } else {
        throw Exception('Your domain is not correct');
      }
    } else {
      throw Exception('Your email is not contains @');
    }
  }
}

class AdminUser extends User with MailDetails {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin MailDetails on User {
  String getMailSystem() {
    int indexOfAt = email.indexOf('@');
    return email.substring(indexOfAt + 1);
  }
}

class UserManager<T extends User> {
  List<T> usersList = [];

  UserManager();

  void addUser(T user) {
    usersList.add(user);
  }

  void deleteUser(String email) {
    bool isInList = false;
    for (T user in usersList) {
      if (user.email == email) {
        isInList = true;
        usersList.remove(user);
        break;
      }
    }
    if (!isInList) {
      throw Exception('This user is not exists');
    }
  }

  void showAllUsers() {
    for (User user in usersList) {
      if (user is GeneralUser) {
        print('Users email: ${user.email}');
      }
      if (user is AdminUser) {
        print('Admin domain: ${user.getMailSystem()}');
      }
    }
  }
}

