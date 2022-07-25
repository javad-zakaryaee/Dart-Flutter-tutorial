import 'dart:io';

main() {
  var birthdays = <String, DateTime>{
    'Nikola Tesla': DateTime.parse('1856-07-10'),
    'Benjamin Franklin': DateTime.parse('1706-01-17'),
    'Albert Einstein': DateTime.parse('1879-03-14'),
    'Charles Darwin': DateTime.parse('1809-02-12')
  };
  print('Welcome, we know the birthdays of:');
  birthdays.forEach((key, value) {
    print(key);
  });
  print('Who\'s birthday do you want to know?');
  var inputName = stdin.readLineSync();
  print(birthdays[inputName]?.toString().substring(0, 9) ?? 'Not Found');
}
