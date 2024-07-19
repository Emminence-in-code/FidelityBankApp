import 'dart:io';

import 'fidelity_app.dart';

void main(List<String> args) {
  String loop = 'yes';
  final List<FidelityBank> accts = [];
  while (loop == 'yes') {
    accts.add(createAccount());
    print('type y to keep goin');
    String? keepGoin = stdin.readLineSync();
    if (!(keepGoin == 'y')) {
      print(accts);
      break;
    }
    ;
  }
}

FidelityBank createAccount() {
  print('What is your name');
  String? name = stdin.readLineSync();
  print('What is your age');

  String? age = stdin.readLineSync();
  print('What is your pin');

  String? pin = stdin.readLineSync();

  return FidelityBank(username: name!, age: int.tryParse(age!)!, pin: pin!);
}
