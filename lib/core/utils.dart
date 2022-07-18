import 'dart:convert';

class Utils {
  static Utils? _instance;
  // Avoid self isntance
  Utils._();
  static Utils get instance {
    _instance ??= Utils._();
    return _instance!;
  }

  static String base64ToString(String baseString) {
    String decoded =
        utf8.decode(base64.decode(baseString)); // username:password
    return decoded;
  }
}
