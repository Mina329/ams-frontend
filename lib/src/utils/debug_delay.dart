part of './utils.dart';

Future<void> _debugDelay([int delay = 2]) async {
  if (kDebugMode) {
    Utils.logger.d('debugDelay($delay)');
    await Future.delayed(Duration(seconds: delay));
  }
}
