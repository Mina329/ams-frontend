import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

export 'extensions.dart';

part 'debug_delay.dart';

class Utils {
  static final logger = Logger(printer: PrettyPrinter());
  static Future<void> Function([int delay]) debugDelay = _debugDelay;
}
