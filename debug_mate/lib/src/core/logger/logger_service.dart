import 'package:debug_mate/src/core/logger/base_logger.dart';
import 'package:debug_mate/src/core/logger/log_level.dart';
import 'package:debug_mate/src/core/logger/log_model.dart';

class LoggerService implements BaseLogger {

  //Creating a singleton for the class LoggerService
  //To make it LoggerService as Central component
  //To prevent Duplicate data
  //All logs should go to same instance
  //Prevents duplicate data

  static final LoggerService _instance = LoggerService._internal();
  factory LoggerService() => _instance;
  LoggerService._internal();

  final List<LogModel> _model = [];

  @override
  void log(String message, LogLevel level, String userId) {
    _model.add(
      LogModel(message: message, level: level, userId: userId, timeStamp: DateTime.now())
    );
  }

  List<LogModel> getLogs() => _model;

  void clearLog() {
    _model.clear();
  }
}



//Important Learnings ->
// Singleton is used to keep the single source of truth for logging across the app. Logging should be centralised and every screen should log into same screen.
// At whatever Places we call the LoggingService Class it will point to same instance
// Singleton ensures consistency, memory efficiency, centralised Logging.
