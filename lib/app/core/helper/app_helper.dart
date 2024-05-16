import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../widgets/app_widgets.dart';

class AppHelper {
  BuildContext? context = Get.context;

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
