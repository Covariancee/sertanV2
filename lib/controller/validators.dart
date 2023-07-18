dynamic phoneValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid phone number';
  }
  if (value.length != 19) {
    return 'too short';
  } else {
    return null;
  }
};

dynamic nameSurnameValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'cannot be empty';
  }
  if (value.length <= 1) {
    return 'must be longer than 2';
  }
  if (value.length >= 17) {
    return 'too long';
  }
  {
    return null;
  }
};

bool _validateEmail(String value) {
  // Regular expression for email validation
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );
  return emailRegex.hasMatch(value);
}

dynamic emailValidator = (value) {
  if (value == null || value.isEmpty || !_validateEmail(value)) {
    return 'Please enter a valid email';
  }
  if (value.length >= 35) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
};

dynamic passwordValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'cannot be empty';
  }
  if (value.length <= 5) {
    return 'must be longer than 6';
  }
  if (value.length >= 17) {
    return 'too long';
  }
  {
    return null;
  }
};

