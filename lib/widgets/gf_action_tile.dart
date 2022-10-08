//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/10/4
//
import 'package:flutter/material.dart';

class GFActionTile extends StatelessWidget {
  const GFActionTile({super.key, required this.title, this.onTap, this.trailingText});

  final String title;
  final VoidCallback? onTap;

  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return _rowWidget(context);
    } else {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: _rowWidget(context),
      );
    }
  }

  Widget _rowWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 14),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            //左侧信息
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  //标题尽可能的展示
                  child: _titleWidget(),
                ),
              ],
            ),
          ),
          _trailingTextWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      padding: EdgeInsets.only(right: 8),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _trailingTextWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxWidth: 84),
            child: Text(
              trailingText ?? "",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
              strutStyle: StrutStyle(
                height: 1,
                leading: 0.5,
              ),
            ),
          ),
          if (onTap != null) ...[
            SizedBox(width: 5),
            _arrowWidget(),
          ],
        ],
      ),
    );
  }

  Widget _arrowWidget() {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      size: 14,
      color: Color(0xFFC6C6C6),
    );
  }
}
