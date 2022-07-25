import 'dart:convert';
import 'dart:io';

main() async {
  Map? birthdayMap;
  if (File('birthdays.json').existsSync()) birthdayMap = await readFromFile();
  if (birthdayMap != null) {
    print('Welcome, we know the birthdays of:');
    birthdayMap.forEach((key, value) {
      print(key);
    });
    print(
        'Who\'s birthday do you want to know? Enter "Add" to add a new one to the list');
    var inputName = stdin.readLineSync() ?? '';
    if (inputName.contains('Add'))
      writeIntoFile();
    else {
      print(birthdayMap[inputName]?.toString().substring(0, 9) ?? 'Not Found');
    }
  } else {
    print(
        '>>We dont know any birthdays yet. Would you like to add one? Y for yes. N to exit.');
    if (stdin.readLineSync() == 'Y')
      writeIntoFile();
    else
      return;
  }
}

Future<Map> readFromFile() async {
  var jsonInput = await File('birthdays.json').readAsString();
  final Map mappedJson = json.decode(jsonInput);
  return Future.value(mappedJson);
}

Future<void> writeIntoFile() async {
  File jsonFile = File('birthdays.json');
  if (!jsonFile.existsSync()) jsonFile.writeAsStringSync('{}');
  var jsonInput = await jsonFile.readAsString();
  Map mappedJson = json.decode(jsonInput);
  print('Who\'s birthday is it?');
  String? birthdayName = stdin.readLineSync() ?? '';
  print('When is the birthday? Enter a date in yyyy-mm-dd format:');
  String? birthDate = stdin.readLineSync() ?? '';
  if (birthDate != null && birthdayName != null) {
    var inputBirthday = {birthdayName: birthDate};
    mappedJson.addAll(inputBirthday);
    print('>>Saved!');
  } else
    throw Exception('Value cannot be null.');
  await File('birthdays.json').writeAsString(json.encode(mappedJson));
}
