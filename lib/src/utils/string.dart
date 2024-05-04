String makeURI(String input) {
  // Convert to lowercase
  String lowercased = input.toLowerCase();

  // Remove leading and trailing spaces
  String trimmed = lowercased.trim();

  // Replace all sequences of white spaces with a single hyphen
  String hyphenated = trimmed.replaceAll(RegExp(r'\s+'), '-');

  return hyphenated;
}
