import 'package:shared_value/shared_value.dart';

import '../config/app_config.dart';

final SharedValue<bool> isLoggedIn = SharedValue(
  value: true, // initial value
  key: "is_logged_in", // disk storage key for shared_preferences
);

final SharedValue<String> token = SharedValue(
  value: "", // initial value
  key: "access_token", // disk storage key for shared_preferences
);

final SharedValue<String> refreshToken = SharedValue(
  value: "", // initial value
  key: "refresh_token", // disk storage key for shared_preferences
);

final SharedValue<int> userId = SharedValue(
  value: 0, // initial value
  key: "user_id", // disk storage key for shared_preferences
);

final SharedValue<String> userName = SharedValue(
  value: "", // initial value
  key: "user_name", // disk storage key for shared_preferences
);

final SharedValue<String> userEmail = SharedValue(
  value: "", // initial value
  key: "user_email", // disk storage key for shared_preferences
);
final SharedValue<String> appLanguage = SharedValue(
  value: AppConfig.default_language, // initial value
  key: "app_language", // disk storage key for shared_preferences
);
