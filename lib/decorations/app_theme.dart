// ignore_for_file: one_member_abstracts, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';

abstract class AppTheme {
  ThemeData getTheme(BuildContext context);
}

class AppLightTheme extends AppTheme {
  @override
  ThemeData getTheme(BuildContext context) {
    return _themeData(themeMode: ThemeMode.light, context: context);
  }
}

class AppDarkTheme extends AppTheme {
  @override
  ThemeData getTheme(BuildContext context) {
    return _themeData(themeMode: ThemeMode.dark, context: context);
  }
}

//Universal
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);

class DarkScheme extends ColorScheme {
  const DarkScheme.dark() : super.dark();
}

class LightScheme extends ColorScheme {
  const LightScheme.light() : super.light();
}

ColorScheme _colorScheme = ColorScheme(
  primary: AppColors.primaryColor,
  secondary: AppColors.primaryColor,
  surface: kWhite,
  error: AppColors.errorColor,
  onSecondary: kBlack,
  onBackground: AppColors.primaryColor,
  onSurface: AppColors.headerTextColor,
  background: kWhite,
  onError: kWhite,
  onPrimary: kWhite,
  brightness: Brightness.light,
);

ColorScheme _darkColorScheme() {
  return ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: kWhite,
    error: AppColors.errorColor,
    onSecondary: kBlack,
    onBackground: AppColors.primaryColor,
    onSurface: AppColors.headerTextColor,
    background: kWhite,
    onError: kWhite,
    onPrimary: kWhite,
    brightness: Brightness.dark,
  );
}

TextTheme _textTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: AppTextStyles.getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: colorScheme.onBackground,
    ),
    displayMedium: AppTextStyles.getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),

    /// [subtite1] is used to style TextFields label text
    titleMedium: AppTextStyles.getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.headerTextColor,
    ),
    titleSmall: AppTextStyles.getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: colorScheme.onBackground,
    ),
    bodyLarge: AppTextStyles.getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: colorScheme.onBackground,
    ),
    bodyMedium: AppTextStyles.getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface,
    ),
    bodySmall: AppTextStyles.getTextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: colorScheme.onSurface,
    ),
    labelLarge: AppTextStyles.getTextStyle(
      fontSize: 16,
      color: colorScheme.surface,
      fontWeight: FontWeight.bold,
    ),
  );
}

ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
  return ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    colorScheme: colorScheme,
    height: 48,
    minWidth: double.infinity,
  );
}

InputDecorationTheme _inputDecorationTheme(
  TextTheme textTheme,
  ColorScheme colorScheme,
) {
  return InputDecorationTheme(
    border: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error, width: 0.5),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error, width: 0.5),
      borderRadius: BorderRadius.circular(4),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.onSurface, width: 0.5),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.onSecondary),
      borderRadius: BorderRadius.circular(4),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.onSurface, width: 0.5),
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: const EdgeInsets.all(16),
  );
}

ThemeData _themeData({
  required ThemeMode themeMode,
  required BuildContext context,
}) {
  switch (themeMode) {
    case ThemeMode.dark:
      final colorScheme = _darkColorScheme();
      return ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: _textTheme(colorScheme),
        buttonTheme: _buttonThemeData(colorScheme),
        dividerColor: AppColors.primaryColor.withOpacity(.5),
        dividerTheme: Theme.of(context).dividerTheme.copyWith(
          color: AppColors.primaryColor.withOpacity(.5),
          thickness: 1,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.white,
        ),
        inputDecorationTheme: _inputDecorationTheme(
          _textTheme(colorScheme),
          colorScheme,
        ),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        colorScheme: colorScheme.copyWith(
          background: colorScheme.background,
          error: colorScheme.error,
        ),
      );
    case ThemeMode.light:
      final colorScheme = _colorScheme;
      return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: _textTheme(colorScheme),
        dividerColor: AppColors.primaryColor,
        dividerTheme: Theme.of(
          context,
        ).dividerTheme.copyWith(color: AppColors.primaryColor, thickness: 1),
        buttonTheme: _buttonThemeData(colorScheme),
        inputDecorationTheme: _inputDecorationTheme(
          _textTheme(colorScheme),
          colorScheme,
        ),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.white,
        ),
        primaryColorLight: colorScheme.primaryContainer,
        colorScheme: colorScheme.copyWith(
          background: colorScheme.background,
          error: colorScheme.error,
        ),
      );
    case ThemeMode.system:
      return ThemeData();
  }
}
