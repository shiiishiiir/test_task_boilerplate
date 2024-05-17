import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/app_widgets.dart';

class AppHelper {
  late SharedPreferences prefs;
  BuildContext? context = Get.context;

  saveStringPref(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getStringPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    String? mprefs = prefs.getString(key);
    return mprefs;
  }

  getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showLoader() {
    EasyLoading.instance
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      ..boxShadow = <BoxShadow>[]
      ..userInteractions = false
      ..indicatorType = EasyLoadingIndicatorType.circle;
    return EasyLoading.show(maskType: EasyLoadingMaskType.none, dismissOnTap: true);
  }

  hideLoader() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  hideKeyboard() {
    // FocusManager.instance.primaryFocus?.unfocus();
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  showNoInternetSnackbar() {
    AppWidgets().getSnackBar(title: "Info", message: "No Internet Connection", waitingTime: 5);
  }
}
