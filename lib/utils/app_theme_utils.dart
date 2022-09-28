//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/23/2022
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icoffee/constants/app_colors.dart';

/// bruno 主题配置
class AppThemeUtils {
  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(
    commonConfig: defaultCommonConfig,
    dialogConfig: defaultDialogConfig,
    appBarConfig: defaultAppBarConfig,
  );

  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig(
    brandPrimary: AppColors.primary,
  );

  /// Dialog配置
  static BrnDialogConfig defaultDialogConfig = BrnDialogConfig(
    radius: 12.0,
  );

  static BrnAppBarConfig defaultAppBarConfig = BrnAppBarConfig(
      systemUiOverlayStyle:  SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
  );
}
