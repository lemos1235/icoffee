//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/10/4
//
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class GFActionCard extends StatelessWidget {
  const GFActionCard({super.key, required this.tiles});

  final List<GFActionTile> tiles;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    tiles.forEachIndexed((index, element) {
      if (index != 0 && index != tiles.length) {
        widgets.add(
          Divider(indent: 12, endIndent: 12, height: 1, color: Color(0xFFECECEC)),
        );
      }
      widgets.add(element);
    });
    return Container(
      child: Column(
        children: widgets,
      ),
    );
  }
}

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
      padding: EdgeInsets.only(left: 18, right: 23, top: 18, bottom: 18),
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
          fontSize: 17,
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
                fontSize: 17,
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
