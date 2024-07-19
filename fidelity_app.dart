import 'account_number.dart';

abstract class BankAccount {
  final String username;
  final int age;
  late String accountNumber;
  late String accountName;
  final String pin;
  double _balance = 0.0;

  BankAccount({
    required this.username,
    required this.age,
    required this.pin,
  }) {
    accountNumber = getAccountNumber();
    accountName = '$username\'s account ';
  }

  String toString() {
    return 'Account of $username';
  }

  void topUp(double amt) {
    if (amt > 0) {
      _balance += amt;
    } else {
      throw Exception('Cannot add negative value');
    }
  }

  double balance() {
    return _balance;
  }
}

class FidelityBank extends BankAccount {
  FidelityBank(
      {required super.username, required super.age, required super.pin});

  bool validPin(String pin) {
    if (pin == this.pin) {
      return true;
    }
    return false;
  }

  void transfer(
      {required double amt,
      required FidelityBank reciever,
      required String pincode}) {
    if (validPin(pincode)) {
      if (amt <= _balance) {
        _balance -= amt;
        // add to new person
        reciever.topUp(amt);
        print('successfull');
      } else {
        throw Exception('Insufficient Balance');
      }
    } else {
      throw Exception('Invalid pin');
    }
  }
}
