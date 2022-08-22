import 'package:icoffee/utils/utils.dart';

export 'toast_util.dart';

/// 用户最后一次触发退出应用的时间戳
int _lastWantToPop = 0;

/// Method that check if user triggered back twice quickly.
/// 检测用户是否快读点击了两次返回，用于双击返回桌面功能。
Future<bool> doubleBackExit() async {
  final int now = DateTime.now().millisecondsSinceEpoch;
  if (now - _lastWantToPop > 800) {
    showToast('再按一次退出应用');
    _lastWantToPop = DateTime.now().millisecondsSinceEpoch;
    return false;
  } else {
    dismissAllToast();
    return true;
  }
}