import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_test/app/routes/app_pages.dart';

import '../flavors/build_config.dart';
import '../flavors/env_config.dart';
import 'core/bindings/initial_bindings.dart';
import 'core/config/app_constants.dart';
import 'core/config/app_theme.dart';
import 'core/translations/localization_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      title: _envConfig.appName,
      initialBinding: InitialBinding(),
      builder: EasyLoading.init(),
      defaultTransition: AppConstants.transition,
      transitionDuration: const Duration(milliseconds: AppConstants.transitionDuration),
      theme: AppTheme.provideAppTheme(context),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocal,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
    );
  }
}
