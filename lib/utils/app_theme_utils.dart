//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/23/2022
//
import 'package:bruno/bruno.dart';
import 'package:icoffee/constants/app_colors.dart';

/// bruno 主题配置
class AppThemeUtils {
  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(
    commonConfig: defaultCommonConfig,
    dialogConfig: defaultDialogConfig,
  );

  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig(
    brandPrimary: AppColors.primary,
  );

  /// Dialog配置
  static BrnDialogConfig defaultDialogConfig = BrnDialogConfig(
    radius: 12.0,
  );
}
