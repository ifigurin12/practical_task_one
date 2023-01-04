import 'dart:math';

/// Класс содержит три метода, первый для вычислеия НОД, второй для вычисления НОК,
/// третий метод является вспомогательным, для нахождения модуля.
///
///
/// Примеры:
///
/// greatestCommonDivider(15, 20) = 5
///
/// leastCommonMultiple(15, 20) = 60;
class DelimetersCalculator {
  static int greatestCommonDivider(int numberOne, int numberTwo) {
    return _absForGcd(numberTwo) != 0
        ? greatestCommonDivider(numberTwo, numberOne % numberTwo)
        : numberOne;
  }

  static int _absForGcd(int number) {
    return number > 0 ? number : -number;
  }

  static int leastCommonMultiple(int numberOne, int numberTwo) {
    return numberOne ~/ greatestCommonDivider(numberOne, numberTwo) * numberTwo;
  }
}

/// Класс содержащий метод для разбиения числа на простые множители.
///
///
/// Пример:
///
/// numberFactorization(12) = [2, 2, 3]
class NumberFactorization {
  static List<int> numberFactorization(int numberForFactorization) {
    List<int> resultValues = [];
    int div = 2;
    while (numberForFactorization > 1) {
      while (numberForFactorization % div == 0) {
        resultValues.add(div);
        numberForFactorization ~/= div;
      }
      div++;
    }
    return resultValues;
  }
}

/// Класс содержит два метода для конвертации чисел из двоичной системы счисления в десятичную, и наоборот
///
///
/// binaryToDecimal('-1010011') = -83
/// binaryToDecimal('1010011') = 83
///
///
/// decimalToBinary(-119) = 0001001
/// decimalToBinary(-119) = 1110111
///
class BinaryAndDecimal {
  static int binaryToDecimal(String binaryNumber) {
    int count = 0, resultValue = 0;
    int number;
    bool isNegative = false;
    if (binaryNumber.startsWith('-')) {
      isNegative = true;
      binaryNumber = binaryNumber.substring(1);
    }
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
      return isNegative ? -resultValue : resultValue;
    }
  }

  static String decimalToBinary(int number) {
    List<String> tempValueList = [];
    bool isNegative = number > 0 ? false : true;
    while (number != 0) {
      if (number % 2 == 0) {
        tempValueList.add('0');
      } else {
       tempValueList.add('1');
      }
      number ~/= 2;
    }
    List<String> preResultValueList = tempValueList.reversed.toList();
    String result = '';
    for (int i = 0; i < preResultValueList.length; i++) {
      if (i == 0 && isNegative)
      {
        result += '-';   
      }
      result += preResultValueList[i];
    }
    return result;
  }
}

/// Содержит три метода для работы со строками:
/// Первый метод - вернет нам цифры в строке
/// Второй метод - вернет нам Map<Word, countWordInString>, где Word - это слово в коллекции строке, 
/// а countWordInString - кол-во вхождений этого слова в коллекцию 
/// Третий метод - вернет нам список чисел от 0 до 9, находящихся в коллекции строк, в 
/// формате английских слов one, two, three и т.д 
///
/// example:
///
/// numbersPerLines('11', '118', 'five', 'dog') = [11, 118];
///
///
/// countWordInStringList('cat', 'cat', 'car', '1567') = {cat: 2, car: 1, 1567: 1};
///
///
/// numbersPerLines('one', 'two', 'one', 'cat') = [1, 2];
///
///
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

  static List<int> numbersFromStringToInt(List<String> words) {
    List<int> resultNumbers = [];

    for (String word in words) {
      if (equalValues.contains(word) &&
          !resultNumbers.contains(equalValues.indexOf(word))) {
        resultNumbers.add(equalValues.indexOf(word));
      }
    }
    return resultNumbers;
  }
}
/// Класс для работы с точками в 3-х мерном пространстве.
/// 
/// Содержит методы для нахождения:
/// 
/// Площади треугольника, через 3 координаты.
/// Расстояния между двумя точками 
/// Произведения двух векторов 
/// 
/// А также вспомогательный метод для нахождения модуля вектора
/// 
///  
/// example: 
/// 
/// Point(-2, 1, 2).distanceTo(Point(1, 2, 3)) = 3.3166247903554; 
/// 
/// Point(-2, 1, 2).areaOfTriangle(Point(3, -3, 4), Point(1, 0, 9)) = 19.78635893740938; 
/// 
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
    return Point(point.xCoords++, point.yCoords++, point.zCoords++);
  }

  double distanceTo(Point another) {
    return sqrt(pow(xCoords - another.xCoords, 2) +
        pow(yCoords - another.yCoords, 2) +
        pow(zCoords - another.zCoords, 2));
  }

  double _vectorABS() {
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
    return 0.5 * vectorOne.vectorMultiple(vectorTwo)._vectorABS();
  }
}

/// Класс содержащий метод, для вычисления корня n степени
/// 
/// Пример: 
/// 
/// calcRootValueInDegree(150, 9) = 1.650475668003059; 
class RootDegree {
  // For calculating root of n degree (7 ex)
  static num calcRootValueInDegree(num number, int degreeOfRoot) {
    return number._rootOfNDegree(degreeOfRoot);
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
    List<String> tempBinaryValues =
        BinaryAndDecimal.decimalToBinary(degree).split('');
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
/// Родительский класс использующийся как основа для двух последующих классов
/// 
/// Содержит проверку на правильность введенного email адреса 
/// 
class User {
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
/// Для вывода домена почты администратора, а не всей почты 
mixin MailDetails on User {
  String getMailSystem() {
    int indexOfAt = email.indexOf('@');
    return email.substring(indexOfAt + 1);
  }
}
/// Класс для хранения всех пользователей 
/// 
/// Обладает методами: 
/// 
/// Добавления пользователя, 
/// 
/// Удаления пользователя по его email
/// 
/// Показа всех пользователей, но у администраторов 
/// Будет выводиться не вся почта, а только домен 


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
