import 'dart:io';

main() {
  print('>>Creating List 1...');
  final list1 = getNumbers();
  print('>>Creating List 2.... ');
  final list2 = getNumbers();
  if (list1 == null || list2 == null)
    throw Exception('One or both lists are null');
  else {
    list1.removeWhere((element) => !list2.contains(element));
    print('Common Elements:');
    list1.toSet().forEach((element) {
      print(element);
    });
  }
}

List? getNumbers() {
  List? inputList = [];
  print('>>How many numbers are going to be in the list?');
  int? listLength = int.tryParse(stdin.readLineSync() ?? '');
  if (listLength == null)
    throw Exception('Valid number not entered!');
  else {
    for (int i = 0; i < listLength; i++) {
      print('>>Enter number ${i + 1}:');
      var inputNumber = int.tryParse(stdin.readLineSync() ?? '');
      inputNumber != null
          ? inputList.add(inputNumber)
          : throw Exception('Non-numerical value entered');
    }
    return inputList;
  }
}
