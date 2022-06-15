import 'package:flutter/material.dart';
import 'package:jot_timer/app/core/ui/app_collors.dart';

class AppConfigUI {
  AppConfigUI._();
  static final ThemeData theme = ThemeData(
    primarySwatch: AppColors.primarySwath,
      primaryColor: const Color(0xFF0066B0),
      primaryColorLight: const Color(0xFF219FFF),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
