import 'package:flutter/foundation.dart';

Future<void> debugDelay([int delay = 3]) async {
  if (kDebugMode) {
    await Future.delayed(Duration(seconds: delay));
  }
}
