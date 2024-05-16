import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    appName: "Basic Boilerplate Dev",
    baseUrl: "",
    shouldCollectCrashLog: true,
    imageViewUrl: '',
    imageUploadUrl: '',
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );
  runApp(
    const MyApp(),
  );
}
