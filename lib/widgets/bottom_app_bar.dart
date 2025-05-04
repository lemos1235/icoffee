//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/24/2022
//
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:icoffee/widgets/feedback.dart';

class FBottomAppBar extends StatefulWidget {
  const FBottomAppBar({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  State<FBottomAppBar> createState() => _FBottomAppBarState();
}

class _FBottomAppBarState extends State<FBottomAppBar> {
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

class FBottomNavigationTile extends StatelessWidget {
  const FBottomNavigationTile(
    this.icon,
    this.label, {
    super.key,
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
      onTap: (enableFeedback ?? false) ? FFeedback.wrapForTap(onTap, context) : onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 9),
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
                child: Text(
                  label,
                  style: TextStyle(fontSize: 10, color: currentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Expanded(child: result);
  }
}

class FBottomNavigationTileItem {
  final Icon icon;
  final String label;

  FBottomNavigationTileItem(this.icon, this.label);
}
