import 'package:debug_mate/src/core/logger/log_level.dart';

abstract class BaseLogger {
  void log(String message, LogLevel level, String userId);
}


//Learning -> 
// To achieve loose coupling, scalibility, and easier testing, created the abstract class.
// Multiple Loggers can implement this BaseLogger.
// Abstract class make the code extensible.
// It is scalable by using mulyiple logger implementation, log persistance, async handling and clean architecture.
//Can add multiple logger like ->>
//Add multiple:
//File Logger
//API Logger
//Crash Logger

// Singleton? ->	Single source of truth
// Abstract class?	->Flexibility & decoupling
// Scaling?	Multi -> logger + storage + DI