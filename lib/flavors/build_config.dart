
import 'env_config.dart';
import 'environment.dart';

class BuildConfig {
  late final Environment environment;
  late final EnvConfig config;
  bool _lock = false;
  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }
}

class SingleToneExample {
  bool d = SingleToneEx.ins._isLocked;
}

class SingleToneEx {
  bool _isLocked = false;

  SingleToneEx._in();

  static final SingleToneEx ins = SingleToneEx._in();

  factory SingleToneEx.instantiate({isOpen}) {
    if (ins._isLocked) return ins;
    ins._isLocked = true;
    return ins;
  }
}
