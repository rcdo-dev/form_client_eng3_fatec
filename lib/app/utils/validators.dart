class Validators {
  static String? emptyField({String? value, String? returnMessage}) {
    if (value != null) {
      if (value.isEmpty) {
        return returnMessage;
      }
    }
    return null;
  }
}
