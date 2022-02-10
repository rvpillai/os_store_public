import 'package:flutter/material.dart';
import 'package:os_store/config/theme/app_colors.dart';
import 'package:os_store/config/theme/app_sizes.dart';

class AppTxtStyles {
  TextStyle titleHeaderStyle = (TextStyle(
    color: AppColors.WHITE,
    fontFamily: 'bg_bold',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes().txtSizeXLarge,
  ));

  TextStyle titleStyle = (TextStyle(
    color: AppColors.BLACK,
    fontFamily: 'bg_bold',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes().txtSizeLarge,
  ));

  TextStyle subTitleStyle = (TextStyle(
    color: AppColors.GREY,
    fontFamily: 'bg_bold',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes().txtSizeLarge,
  ));

  TextStyle iconStyle = (TextStyle(
    color: AppColors.WHITE,
    fontFamily: 'bg_bold',
    decoration: TextDecoration.none,
    // fontWeight: FontWeight.bold,
    fontSize: AppSizes().txtSizeLarge,
  ));


}
