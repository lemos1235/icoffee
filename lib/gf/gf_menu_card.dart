//
// [Author] lg (https://github.com/lemos1235)
// [Date] 10/8/2022
//
import 'package:flutter/material.dart';

class GFMenuCard extends StatelessWidget {
  const GFMenuCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    var len = children.length;
    for (int i = 0; i < len; i++) {
      final item = children[i];
      if (i != 0 && i != len) {
        widgets.add(
          const Divider(indent: 12, endIndent: 12, height: 1, color: Color(0xFFECECEC)),
        );
      }
      widgets.add(item);
    }
    return Column(
      children: widgets,
    );
  }
}
