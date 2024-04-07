import 'package:front/core/services/injection_container.dart';
import 'package:logger/logger.dart';

Logger getLogger(Type type) {
  return Logger(printer: CustomPrinter(type.toString() , Level.error));
}

class CustomPrinter extends LogPrinter {
  final String className;
  final Level level;

  CustomPrinter(this.className, this.level);

  @override
  List<String> log(LogEvent event) {
    final color = sl<PrettyPrinter>().levelColors?[event.level];
    final emoji = sl<PrettyPrinter>().levelEmojis?[event.level];
    final message = event.message;
    return [color!('$emoji $className $message')];
  }
}
