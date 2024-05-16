import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test/app/core/config/app_colors.dart';

class AppWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  Widget gapW8() {
    return SizedBox(
      width: 8.w,
    );
  }

  Widget gapH8() {
    return SizedBox(
      height: 8.h,
    );
  }

  Widget gapH16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Widget gapW16() {
    return SizedBox(
      width: 16.w,
    );
  }

  Widget gapW12() {
    return SizedBox(
      width: 12.w,
    );
  }

  Widget gapW24() {
    return SizedBox(
      width: 24.w,
    );
  }

  Widget gapH12() {
    return SizedBox(
      height: 12.h,
    );
  }

  Widget gapH24() {
    return SizedBox(
      height: 24.h,
    );
  }

  Widget divider() {
    return const Divider(
      color: Color.fromRGBO(221, 221, 221, 1),
      thickness: 1,
    );
  }

  appExitDialog() {
    Get.defaultDialog(
      title: 'Alert !',
      titlePadding: const EdgeInsets.only(top: 15),
      barrierDismissible: false,
      content: Text('home_screen_close_app'.tr),
      actions: [
        TextButton(
            style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(AppColors.iconDark), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black)))),
            onPressed: () {
              Get.back();
            },
            child: Text('common_no'.tr, style: const TextStyle(color: Colors.white))),
        TextButton(
            style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(AppColors.iconLight), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black)))),
            onPressed: () {
              Platform.isAndroid ? SystemNavigator.pop() : exit(0);
            },
            child: Text(
              'common_yes'.tr,
              style: const TextStyle(color: Colors.white),
            )),
      ],
    );
  }

  SnackbarController getSnackBar({title = "Attention", message = " Some message", int waitingTime = 2, int animationDuration = 500, snackPosition = SnackPosition.TOP, Color backgroundColor = AppColors.black, double backgroundColorOpacity = .7, colorText = AppColors.white, closeAllSnackbars = true}) {
    closeAllSnackbars ? Get.closeAllSnackbars() : null;
    return Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      duration: Duration(seconds: waitingTime),
      animationDuration: Duration(milliseconds: animationDuration),
      backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
      colorText: colorText,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(BuildContext context, String? message, {Color backGroundColor = AppColors.black, Color textColor = AppColors.white}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); //dismiss all previous snackBar flutter
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backGroundColor.withOpacity(.9),
        content: Text(message!),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Close',
          textColor: textColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
