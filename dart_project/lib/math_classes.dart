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
        if (inputStringList[i] == inputStringList[j])
        {
          count++; 
        }
      }
      resultMap[inputStringList[i]] = count; 
    }
  }
  return resultMap;
}
