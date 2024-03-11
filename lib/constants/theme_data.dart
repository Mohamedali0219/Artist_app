import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static ThemeData themeData({required BuildContext context}) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        fillColor: const Color.fromARGB(255, 237, 237, 237),
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: transparentColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: transparentColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ThemeData().colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ThemeData().colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData darkTheme({required BuildContext context}) {
    return ThemeData(
      primaryColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey.shade900,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        fillColor: const Color.fromARGB(255, 133, 137, 147),
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: transparentColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: transparentColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ThemeData().colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ThemeData().colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      cardColor: Colors.grey.shade700,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.white),
      textTheme: TextTheme(
          displayLarge: TextStyle(
              letterSpacing: -1.5,
              fontSize: 48,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              letterSpacing: -1.0,
              fontSize: 40,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              letterSpacing: -1.0,
              fontSize: 32,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              letterSpacing: -1.0,
              color: Colors.grey.shade50,
              fontSize: 28,
              fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(
              letterSpacing: -1.0,
              color: Colors.grey.shade50,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleLarge: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 17,
              fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          labelLarge: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          labelSmall: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 10,
              fontWeight: FontWeight.w400)),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
    );
  }
}
