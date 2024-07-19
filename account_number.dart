String _databasePassword = '123';

String getAccountNumber() {
  String validAcct = '${DateTime.now().toUtc()}${_databasePassword}';
  validAcct = validAcct
      .replaceAll('-', '')
      .replaceAll(' ', '')
      .replaceAll(':', '')
      .replaceAll('.', '');
  return validAcct;
}
