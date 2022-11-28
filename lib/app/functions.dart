import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:muslim/core/values/app_strings.dart';

/// Just print in Debug mode
void printLog(String message){
  if(kDebugMode) log(message);

}


String getPlaceArabic(String place){
  if(place == 'Makkah'){
    return AppStrings.makkah;
  }
  else {
    return AppStrings.madinah;
  }
}