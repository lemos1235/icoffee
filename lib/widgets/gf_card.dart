//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/23/2022
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class GFCard extends StatefulWidget {
  const GFCard({
    Key? key,
    this.title,
    this.onPressed,
    this.onMore,
    required this.content,
    this.titlePadding = const EdgeInsets.only(left: 15, right: 15, top: 14, bottom: 14),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    this.bottomPadding = const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
    this.bottom,
  }) : super(key: key);

  final Widget? title;

  final GestureTapCallback? onPressed;

  final GestureTapCallback? onMore;

  final Widget content;

  final Widget? bottom;

  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final EdgeInsets bottomPadding;

  @override
  State<GFCard> createState() => _GFCardState();
}

class _GFCardState extends State<GFCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        if (details.offsetFromOrigin.dy.abs() > 3) {
          _controller.reverse();
        }
      },
      onLongPressStart: (LongPressStartDetails details) {
        _controller.forward();
      },
      onLongPressEnd: (LongPressEndDetails details) {
        if (_controller.value >= 0.8) {
          //跳转页面
        }
        _controller.reverse();
      },
      behavior: HitTestBehavior.translucent,
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.96)
            .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
        child: BrnShadowCard(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: widget.titlePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.title != null) widget.title!,
                    if (widget.onMore != null)
                      GestureDetector(
                        onTap: widget.onMore,
                        behavior: HitTestBehavior.translucent,
                        child: Icon(Icons.more_vert, size: 22),
                      ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
                thickness: 0.5,
                height: 1,
              ),
              Padding(
                padding: widget.contentPadding,
                child: widget.content,
              ),
              if (widget.bottom != null)
                Padding(
                  padding: widget.bottomPadding,
                  child: widget.bottom!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
