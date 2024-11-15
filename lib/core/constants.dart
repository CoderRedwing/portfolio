import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF008080); // Teal
  static const Color backgroundColor = Color(0xFFF0F8FF); // Light background
  static const Color textColor = Color(0xFF333333); // Dark text
}

class AppTextStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,  // Ensure non-nullable
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 24,
    color: AppColors.textColor,  // Ensure non-nullable
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,  // Ensure non-nullable
  );
}

class AppPadding {
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0);
}

class AppStrings {
  static const String landingTitle = "Hi, I'm Ajitesh";
  static const String landingSubtitle = "Mobile & Web Developer";
}
