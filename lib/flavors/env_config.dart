import 'package:logger/logger.dart';

import '../app/core/config/app_constants.dart';


class EnvConfig {
  final String appName;
  final String baseUrl;
  final String imageViewUrl;
  final String imageUploadUrl;
  final bool shouldCollectCrashLog;
  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.imageViewUrl,
    required this.imageUploadUrl,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: AppConstants.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppConstants.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppConstants.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
