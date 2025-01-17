import 'package:flutter/material.dart';
import 'package:testline/utils/colors.dart';

bool isLightTheme(context){
  return Theme.of(context).scaffoldBackgroundColor==AppColor.whiteColor;
}