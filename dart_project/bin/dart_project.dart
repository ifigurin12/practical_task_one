
import 'package:dart_project/math_classes.dart';

void main(List<String> arguments) {
  print(DelimetersCalculator.greatestCommonDivider(15, 20));
  print(DelimetersCalculator.leastCommonMultiple(15, 20));

  NumberFactorization numberFactorizationTest = NumberFactorization(12);
  print(numberFactorizationTest.numberFactorization());

  print(BinaryAndDecimal.binaryToDecimal('1010011'));
  print(BinaryAndDecimal.decimalToBinary(119));

  String forCheckNumbersPerLines = '1 2 3 cat dog 2 4 bad worse next 13.4';
  print(StringAndWords.numbersPerLines(forCheckNumbersPerLines).toString());

  List<String> stringListToMapTaskCheck = ['11', '11', '21', 'cat', 'cat', '714'];
  print(StringAndWords.countWordInStringList(stringListToMapTaskCheck));

  List<String> forCheckNumbersForStringToInt = [
    'five',
    'five',
    'one', 
    'one',
    'two',
    'klop',
    'ten',
    'ten',
    'cat',
    'dog',
    'ten',
  ];
  print(StringAndWords.numbersFromStringToInt(forCheckNumbersForStringToInt));
  
  Point p1 = Point(-2, 1, 2);
  print(p1.distanceTo(Point(1, 2, 3)));
  print(p1.areaOfTriangle(Point(3, -3, 4), Point(1, 0, 9)));

  RootDegree forCheckExtensionTask = RootDegree(-150, 9); 
  print(forCheckExtensionTask.calcRootValueInDegree()); 

  
  GeneralUser simpleUserOne = GeneralUser('privet@ok.ru');
  GeneralUser simpleUserTwo = GeneralUser('poka@bk.ru');
  GeneralUser simpleUserThree = GeneralUser('panzer@ispu.ru');
  AdminUser adminOne = AdminUser('apok@ok.ru');
  AdminUser adminTwo = AdminUser('prill@yandex.com');
  AdminUser adminThree = AdminUser('thrill@gmail.com');
  UserManager usM = UserManager();
  usM.addUser(simpleUserOne);
  usM.addUser(simpleUserTwo);
  usM.addUser(simpleUserThree);
  usM.addUser(adminOne);
  usM.addUser(adminTwo);
  usM.addUser(adminThree);
  usM.showAllUsers();
  usM.deleteUser('panzer@ispu.ru');
  usM.deleteUser('thrill@gmail.com');
  usM.deleteUser('poka@bk.ru');
  print('--------------------');
  usM.showAllUsers();
  
}



