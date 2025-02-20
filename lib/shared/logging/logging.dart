import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

/// Logging class that handles all types of logs in the app (general logs, Dio HTTP logs, etc.)
class Log {
  // Talker instance for general logging
  static Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      colors: {
        'info': AnsiPen()..blue(),
        'warning': AnsiPen()..yellow(),
        'error': AnsiPen()..red(),
        'critical': AnsiPen()..magenta(),
      },
      titles: {
        'info': 'Info',
        'warning': 'Warning',
        'error': 'Error',
        'critical': 'Critical',
      },
      enabled: kDebugMode,
      useConsoleLogs: kDebugMode,
    ),
  );

  // Dio Logger for HTTP request/response logging
  static TalkerDioLogger dioLogger =
  TalkerDioLogger(talker: talker, settings: TalkerDioLoggerSettings());

  static TalkerRiverpodObserver talkerRiverpodObserver = TalkerRiverpodObserver(
    talker: talker,
    settings: TalkerRiverpodLoggerSettings(printStateFullData: true),
  );

  static TalkerRouteObserver talkerRouteObserver =
  TalkerRouteObserver(Log.talker);

  /// Simple log methods for info, warning, and error levels.
  static void info(
      dynamic msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {
    talker.info(msg, exception, stackTrace);
  }

  static void warning(
      dynamic msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {
    talker.warning(msg, exception, stackTrace);
  }

  static void error(
      dynamic msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {
    talker.error(msg, exception, stackTrace);
  }

  static void debug(
      dynamic msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {
    talker.debug(msg, exception, stackTrace);
  }

  static void verbose(
      dynamic msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {
    talker.verbose(msg, exception, stackTrace);
  }

  /// Global error handler for uncaught exceptions.
  static void handleError(Object error, StackTrace? stack) {
    talker.handle(error, stack, 'Uncaught exception');
  }
}