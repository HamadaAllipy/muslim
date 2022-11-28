import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim/core/values/app_color.dart';

ThemeData getLightTheme(){
  return ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
      )
    )
  );
}