import 'dart:io';
import 'dart:convert';

void main() async {
  var data = await readFromFile();
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List count = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  data.forEach((key, value) {
    if (value != null && key != null) {
      count[DateTime.parse(value).month - 1]++;
    }
  });
  months.forEach((element) {
    var month = months.indexOf(element);
    count[month] != 0 ? print('$element: ${count[month]}') : {};
  });
}

Future<Map> readFromFile() async {
  var jsonInput = await File('birthdays.json').readAsString();
  final Map mappedJson = json.decode(jsonInput);
  return Future.value(mappedJson);
}
