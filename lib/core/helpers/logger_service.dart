import 'package:logger/logger.dart';
import '../di/dependency_injection.dart';

class LoggerService {
  LoggerService();
  void info(
    dynamic message, {
    DateTime? time,
  }) {
    getIt<Logger>().i(message, time: time);
  }
}
