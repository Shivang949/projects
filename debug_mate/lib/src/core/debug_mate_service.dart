import 'package:flutter/cupertino.dart';

import '../../debug_mate.dart';
import 'logger/logger_service.dart';

class DebugMateService {
  static final DebugMateService _instance = DebugMateService._internal();

  factory DebugMateService() => _instance;

  DebugMateService._internal();

  static final LoggerService _loggerService = LoggerService();

  static void init({required String appId}) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details); // keep default behavior

      DebugMateService.log(
        details.exceptionAsString(),
        LogLevel.error,
        "system",
      );
    };
  }

  static void log(String message, LogLevel level, String userId) {
    _loggerService.log(message, level, userId);
  }

  static List<LogModel> getLogs() {
    return _loggerService.getLogs();
  }

  static void clearLogs() {
    _loggerService.clearLog();
  }
}