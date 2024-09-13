import 'package:logger/logger.dart';

class AppLog {
  static var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(
      colors: true,
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.none,
    ), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)

  );

  static void e(String tag, String message) {
    logger.e("$tag: $message");
  }

  static void d(String tag, String message) {
    logger.d("$tag: $message");
  }

  static void i(String tag, String message) {
    logger.i("$tag: $message");
  }

  static void w(String tag, String message) {
    logger.w("$tag: $message");
  }
}
