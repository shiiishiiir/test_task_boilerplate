import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData provideAppTheme(context) {
    return ThemeData(
      useMaterial3: false,
      primaryColor: AppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.primary[50],
      fontFamily: "iregular",
      primaryIconTheme: const IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.primary[50],
        elevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarTextStyle: const TextStyle(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 26),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 60,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary[50],
        unselectedIconTheme: IconThemeData(color: AppColors.primary[100]),
        unselectedItemColor: AppColors.primary[100],
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          color: AppColors.primary[100],
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary[50]).copyWith(background: AppColors.primary[50]),
    );
  }
}
