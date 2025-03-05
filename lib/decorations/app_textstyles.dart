import 'dart:io';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle headerPrimary(
    BuildContext context, {
    double? fontSize,
    double? letterSpacing,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double? height,
  }) => Theme.of(context).textTheme.displayMedium!.copyWith(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize ?? _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    wordSpacing: wordSpacing,
    letterSpacing:
        letterSpacing ??
        ((fontSize ?? _getFontsize(fontSize)) > 20 ? -0.6 : -0.2),
    height: height,
  );

  static TextStyle header(
    BuildContext context, {
    double? fontSize,
    double? letterSpacing,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double? height,
    String? fontFamily,
  }) => Theme.of(context).textTheme.titleMedium!.copyWith(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize ?? _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    wordSpacing: wordSpacing,
    letterSpacing:
        letterSpacing ??
        ((fontSize ?? _getFontsize(fontSize)) > 20 ? -0.6 : -0.2),
    fontFamily: fontFamily,
    height: height,
  );

  static TextStyle subtitle(
    BuildContext context, {
    double? fontSize,
    double? letterSpacing = -0.2,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double height = 1.5,
  }) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize ?? _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );
  static TextStyle subtitleWhiteFg(
    BuildContext context, {
    double? fontSize,
    double? letterSpacing,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double height = 1.5,
  }) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: color ?? const Color(0xff8b8b8b),
    fontWeight: fontWeight,
    fontSize: fontSize ?? _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );

  static TextStyle body(
    BuildContext context, {
    double? fontSize,
    double? letterSpacing = -0.2,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double? height,
  }) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize ?? _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );

  static TextStyle getTextStyle({
    double? fontSize,
    double? letterSpacing,
    Color? color,
    FontStyle? fontStyle,
    TextStyle? textStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    double? height,
  }) => TextStyle(
    height: height,
    color: color,
    fontWeight: fontWeight,
    fontSize: _getFontsize(fontSize),
    fontStyle: fontStyle,
    decoration: decoration,
    fontFamily: 'Euclid',
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
  );

  static double _getFontsize(double? fontSize) {
    return Platform.isAndroid
        ? fontSize ?? 12
        : fontSize == null
        ? 14
        : fontSize + 2;
  }
}
