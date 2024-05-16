import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_test/app/core/config/app_config.dart';
import 'package:task_test/app/core/config/remote_config.dart';

import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  await ScreenUtil.ensureScreenSize();
  EnvConfig devConfig = EnvConfig(
    appName: AppConfig.appName,
    baseUrl: RemoteConfig.baseURL,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );
  runApp(
    const MyApp(),
  );
}
