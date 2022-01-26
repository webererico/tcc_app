String? validatePassword(String? value) {
  if (value == null || value.isEmpty)
    return 'Password is Empty';
  else
    return null;
}

String? emptyField(String? value) {
  if (value == null || value.isEmpty)
    return 'Field can\'t be empty.';
  else
    return null;
}

String? validatorEmail(String? value) {
  if (value == null || value.isEmpty) return 'Field can\'t be empty.';
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)
      ? null
      : 'Email invalid.';
}
