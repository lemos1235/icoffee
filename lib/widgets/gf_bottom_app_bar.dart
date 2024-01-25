//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/24/2022
//
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:icoffee2/widgets/gf_feedback.dart';

class GFBottomAppBar extends StatefulWidget {
  const GFBottomAppBar({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  State<GFBottomAppBar> createState() => _GFBottomAppBarState();
}

class _GFBottomAppBarState extends State<GFBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: DefaultTextStyle.merge(
        overflow: TextOverflow.ellipsis,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.children,
        ),
      ),
    );
  }
}

class GFBottomNavigationTile extends StatelessWidget {
  const GFBottomNavigationTile(
    this.icon,
    this.label, {
    this.selected = false,
    this.onTap,
    this.enableFeedback,
  });

  final Icon icon;
  final String label;

  final bool selected;

  final bool? enableFeedback;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    Color currentColor = selected ? themeData.colorScheme.primary : themeData.unselectedWidgetColor;
    Widget result = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (enableFeedback ?? false) ? GFFeedback.wrapForTap(onTap, context) : onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 1.0,
              child: IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: currentColor,
                ),
                child: icon,
              ),
            ),
            MediaQuery(
              data: mediaQueryData.copyWith(
                textScaleFactor: math.min(1.0, mediaQueryData.textScaleFactor),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 1.0,
                child: Container(
                    child: Text(
                  label,
                  style: TextStyle(fontSize: 10, color: currentColor),
                )),
              ),
            ),
          ],
        ),
      ),
    );
    return Expanded(child: result);
  }
}

class GFBottomNavigationTileItem {
  final Icon icon;
  final String label;

  GFBottomNavigationTileItem(this.icon, this.label);
}
