//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/24/2022
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class FEnhanceNumberCard extends StatelessWidget {
  final List<FNumberInfoItemModel>? itemChildren;

  ///如果超过一行，行间距则 默认为16
  final double? runningSpace;

  ///Item的上半部分和下半部分的间距 默认为8
  final double? itemRunningSpace;

  ///每一行显示的数量 默认为3
  final int rowCount;

  ///背景色 默认为白色
  final Color backgroundColor;

  ///左侧的间距 默认20
  final EdgeInsets padding;

  final TextAlign itemTextAlign;

  final BrnEnhanceNumberCardConfig? themeData;

  const FEnhanceNumberCard({
    Key? key,
    this.itemChildren,
    this.rowCount = 3,
    this.runningSpace,
    this.itemRunningSpace,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.backgroundColor = Colors.white,
    this.itemTextAlign = TextAlign.left,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrnEnhanceNumberCardConfig defaultConfig = themeData ?? BrnEnhanceNumberCardConfig();

    defaultConfig = defaultConfig
        .merge(BrnEnhanceNumberCardConfig(runningSpace: runningSpace, itemRunningSpace: itemRunningSpace));
    defaultConfig = BrnThemeConfigurator.instance
        .getConfig(configId: defaultConfig.configId)
        .enhanceNumberCardConfig
        .merge(defaultConfig);

    if (itemChildren == null || itemChildren!.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget contentWidget = const SizedBox(
          height: 0,
          width: 0,
        );
        // 容错显示的行数 显示三行
        int count = rowCount;
        if (rowCount <= 0 || rowCount > itemChildren!.length) {
          count = 3;
        }
        double width = constraints.maxWidth;
        double singleWidth = (width - padding.left - padding.right) / count;

        if (itemChildren!.length > 1) {
          // 平铺下来
          contentWidget = Wrap(
            runSpacing: defaultConfig.runningSpace,
            spacing: 0.0,
            children: itemChildren!.map((data) {
              //每行的最后一个  不显示分割线
              //最后一个元素 不显示分割线
              bool condition1 = (itemChildren!.indexOf(data) + 1) % count == 0;
              bool condition2 = itemChildren!.last == data;
              bool allCondition = condition1 || condition2;

              bool isFirst = (itemChildren!.indexOf(data) + 1) % count == 1;
              return SizedBox(
                  width: singleWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 每行的第一个 的左边距是0，使用的是leftPadding的功能
                      // 每行的最后一个的 右边距，使用的是rightPadding的功能
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: isFirst ? 5 : 10, right: condition1 ? 0 : 5),
                        child: _buildItemWidget(data, defaultConfig,
                            width: singleWidth - (isFirst ? 0 : 20) - (condition1 ? 0 : 20)),
                      )),
                      //分割线的显示规则是：固定高度47
                      //                item之间显示，最后一个不显示
                      Visibility(
                        visible: !allCondition,
                        child: Container(
                          height: 47,
                          width: defaultConfig.dividerWidth,
                          color: defaultConfig.commonConfig.dividerColorBase,
                        ),
                      ),
                    ],
                  ));
            }).toList(),
          );
        } else {
          contentWidget = _buildItemWidget(itemChildren![0], defaultConfig);
        }

        return Container(
          padding: padding,
          color: backgroundColor,
          child: contentWidget,
        );
      },
    );
  }

  Widget _buildItemWidget(FNumberInfoItemModel model, BrnEnhanceNumberCardConfig config, {double? width}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildTopWidget(model, config, width: width),
        SizedBox(
          height: itemRunningSpace,
        ),
        _buildBottomWidget(model, config, width: width)
      ],
    );
  }

  Widget _buildTopWidget(FNumberInfoItemModel model, BrnEnhanceNumberCardConfig config, {double? width}) {
    if (model.topWidget != null) {
      return model.topWidget!;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        _getPreWidget(model.preDesc, config),
        Container(
          constraints: BoxConstraints(maxWidth: width ?? double.infinity),
          height: 26,
          transform: Matrix4.translationValues(0, 1, 0),
          child: Text(model.number!,
              style: TextStyle(
                height: 1.0,
                textBaseline: TextBaseline.ideographic,
                color: config.titleTextStyle.color,
                package: BrnStrings.flutterPackageName,
                fontWeight: config.titleTextStyle.fontWeight,
                fontSize: config.titleTextStyle.fontSize,
                fontFamily: 'Bebas',
              )),
        ),
        _getLastWidget(model.lastDesc, config),
      ],
    );
  }

  Widget _buildBottomWidget(FNumberInfoItemModel model, BrnEnhanceNumberCardConfig config, {double? width}) {
    if (model.bottomWidget != null) {
      return model.bottomWidget!;
    }
    TextSpan span = TextSpan(text: model.title ?? "", style: config.descTextStyle.generateTextStyle());
    TextPainter tp = TextPainter(
      text: span,
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: width ?? double.infinity);
    Widget text = Text(
      model.title ?? "",
      textAlign: itemTextAlign,
      maxLines: 2,
      style: config.descTextStyle.generateTextStyle(),
      overflow: TextOverflow.ellipsis,
    );
    if (model.iconTapCallBack != null) {
      Widget icon = BrunoTools.getAssetSizeImage(BrnAsset.iconQuestion, 14, 14);

      if (model.numberInfoIcon == FNumberInfoIcon.arrow) {
        icon = BrunoTools.getAssetSizeImage(BrnAsset.iconRightArrow, 14, 14);
      }
      debugPrint('${tp.height}');
      debugPrint(model.title);
      text = Row(
        mainAxisAlignment: itemTextAlign == TextAlign.center
            ? MainAxisAlignment.center
            : (itemTextAlign == TextAlign.right ? MainAxisAlignment.end : MainAxisAlignment.start),
        crossAxisAlignment: tp.height > 22 ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: text,
          ),
          GestureDetector(
            onTap: () {
              model.iconTapCallBack!(model);
            },
            child: icon,
          )
        ],
      );
    }
    return text;
  }

  Widget _getPreWidget(String? preDesc, BrnEnhanceNumberCardConfig config) {
    if (preDesc == null || preDesc.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Text(
        preDesc,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          color: config.titleTextStyle.color,
          fontSize: config.descTextStyle.fontSize,
        ),
      ),
    );
  }

  Widget _getLastWidget(String? lastDesc, BrnEnhanceNumberCardConfig config) {
    if (lastDesc == null || lastDesc.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 0),
      child: Text(lastDesc,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: config.titleTextStyle.color,
            fontSize: config.descTextStyle.fontSize,
          )),
    );
  }
}

/// 用来显示强化数据的model
class FNumberInfoItemModel {
  ///number必须是非中文，否则会展示异常，如果有中文信息 则设置pre和last字段
  final String? number;

  ///下半部分的辅助信息
  final String? title;

  ///强化信息的前面展示字段
  final String? preDesc;

  ///强化信息的后面展示字段
  final String? lastDesc;

  ///icon的事件
  final Function(FNumberInfoItemModel)? iconTapCallBack;

  ///icon的样式 可枚举 , 默认为问号
  final FNumberInfoIcon numberInfoIcon;

  ///上半部分的自定义内容 如果设置了优先级则高于 number、preDesc和lastDesc
  final Widget? topWidget;

  ///下半部分的自定义内容 如果设置了优先级则高于 title
  final Widget? bottomWidget;

  ///上部分的：（number、preDesc、lastDesc）和topWidget 必须设置一个
  ///下部分的：title和title 必须设置一个
  FNumberInfoItemModel({
    this.number,
    this.title,
    this.numberInfoIcon = FNumberInfoIcon.question,
    this.iconTapCallBack,
    this.preDesc,
    this.lastDesc,
    this.bottomWidget,
    this.topWidget,
  });
}

///可扩展
enum FNumberInfoIcon {
  arrow,
  question,
}
