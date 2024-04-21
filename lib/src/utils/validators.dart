bool isPhone(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  RegExp phoneRegex = RegExp(r'^\+380[0-9]{9}');

  if (phoneRegex.hasMatch(value)) {
    return true;
  }

  return false;
}

bool isLink(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  RegExp linkRegex = RegExp(r'^(http://|https://)?[a-z0-9]+\.[a-z0-9\\]+');

  if (linkRegex.hasMatch(value.toLowerCase())) {
    return true;
  }

  return false;
}
