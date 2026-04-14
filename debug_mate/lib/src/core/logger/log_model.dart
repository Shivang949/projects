import 'package:debug_mate/src/core/logger/log_level.dart';

class LogModel {
  final String message;
  final LogLevel level;
  final String userId;
  final DateTime timeStamp;

  LogModel({
    required this.message,
    required this.level,
    required this.userId,
    required this.timeStamp,
  });
}

