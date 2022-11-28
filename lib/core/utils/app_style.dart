import 'dart:ui';

import 'package:flutter/material.dart' show Color, TextStyle;
import 'package:muslim/core/values/app_color.dart';
import 'package:muslim/core/values/app_fonts.dart';

TextStyle _getURWDINStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
      fontFamily: FontFamily.urwDinArabic,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle({
  Color color = AppColor.white,
  required double fontSize,
}) {
  return _getURWDINStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeights.regular,
  );
}


TextStyle getMediumStyle({
  Color color = AppColor.white,
  required double fontSize,
}) {
  return _getURWDINStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeights.medium,
  );
}


TextStyle getBoldStyle({
  Color color = AppColor.white,
  required double fontSize,
}) {
  return _getURWDINStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeights.bold,
  );
}
