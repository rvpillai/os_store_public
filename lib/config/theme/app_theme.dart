import 'package:flutter/material.dart';
import 'package:os_store/config/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: AppColors.BLUE,
  splashColor: AppColors.BLUE,
  highlightColor: AppColors.BLUE,
  fontFamily: 'Brandon-Grotesque',
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.BLUE),
);
