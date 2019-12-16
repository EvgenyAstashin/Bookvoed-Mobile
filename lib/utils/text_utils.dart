bool isStringEmpty(String value) {
  return value == null || value.trim().length == 0;
}

bool isStringNotEmpty(String value) {
  return !isStringEmpty(value);
}