//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/24
//
import 'package:bruno/bruno.dart';
import 'package:flutter/widgets.dart';

class FRichInfoGrid extends StatelessWidget {
  final List<BrnRichGridInfo>? pairInfoList;

  ///行间距 纵向
  final double? rowSpace;

  ///gridView 为children包裹的padding，默认是从media中获取，支持修改
  ///同gridView的padding
  final EdgeInsetsGeometry? padding;

  ///元素间距 横向
  final double? space;

  final double? itemHeight;

  /// 一共多少列 默认2列
  final int crossAxisCount;

  ///值排列方向
  final Axis direction;

  final BrnPairRichInfoGridConfig? themeData;

  const FRichInfoGrid({
    Key? key,
    this.pairInfoList,
    this.padding,
    this.rowSpace,
    this.space,
    this.itemHeight,
    this.crossAxisCount = 2,
    this.direction = Axis.horizontal,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pairInfoList == null || pairInfoList!.isEmpty) {
      return const SizedBox(height: 0, width: 0);
    }

    return _buildGridView(context);
  }

  Widget _buildGridView(context) {
    BrnPairRichInfoGridConfig defaultConfig = themeData ?? BrnPairRichInfoGridConfig();

    defaultConfig = defaultConfig
        .merge(BrnPairRichInfoGridConfig(itemSpacing: space, rowSpacing: rowSpace, itemHeight: itemHeight));
    defaultConfig = BrnThemeConfigurator.instance
        .getConfig(configId: defaultConfig.configId)
        .pairRichInfoGridConfig
        .merge(defaultConfig);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double gridWidth = constraints.maxWidth;
        if (gridWidth == double.infinity) {
          gridWidth = MediaQuery.of(context).size.width;
        }
        double itemHeight = defaultConfig.itemHeight * (MediaQuery.textScaleFactorOf(context));
        if (direction == Axis.vertical) {
          itemHeight = itemHeight * 2;
        }
        double itemWidth = (gridWidth - defaultConfig.itemSpacing) / 2;

        var gridView = GridView.builder(
          shrinkWrap: true,
          padding: padding,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: defaultConfig.rowSpacing,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultConfig.itemSpacing,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemBuilder: (context, index) {
            return direction == Axis.horizontal
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _getKeyWidget(
                        pairInfoList![index],
                        gridWidth,
                        context,
                        defaultConfig,
                      ),
                      _getValueWidget(pairInfoList![index], defaultConfig)
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getKeyWidget(
                        pairInfoList![index],
                        gridWidth,
                        context,
                        defaultConfig,
                      ),
                      _getValueWidget(pairInfoList![index], defaultConfig)
                    ],
                  );
          },
          itemCount: (null != pairInfoList) ? pairInfoList!.length : 0,
        );
        return gridView;
      },
    );
  }

  Widget _getKeyWidget(
      BrnRichGridInfo info, double width, BuildContext context, BrnPairRichInfoGridConfig config) {
    if (info.keyPart == null) {
      return Container(
        height: 0,
        width: 0,
      );
    }

    if (info.keyPart is String) {
      return Container(
        constraints: BoxConstraints(maxWidth: width / 4),
        child: Text(info.keyPart,
            maxLines: 1, overflow: TextOverflow.ellipsis, style: _getKeyStyle(themeData: config)),
      );
    }
    if (info.keyPart is Widget) {
      return info.keyPart;
    }

    return Container(
      height: 0,
      width: 0,
    );
  }

  Widget _getValueWidget(BrnRichGridInfo info, BrnPairRichInfoGridConfig config) {
    if (info.valuePart == null) {
      return Text('--', style: _getValueStyle('--', themeData: config));
    }
    if (info.valuePart is String) {
      String value = info.valuePart.isEmpty ? '--' : info.valuePart;
      return Expanded(
        child: Text(value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _getValueStyle(info.valuePart, themeData: config)),
      );
    }
    if (info.valuePart is Widget) {
      return info.valuePart;
    }

    return Container(
      height: 0,
      width: 0,
    );
  }
}

TextStyle? _getKeyStyle({BrnPairRichInfoGridConfig? themeData}) =>
    themeData?.keyTextStyle.generateTextStyle();

TextStyle? _getValueStyle(String content, {BrnPairRichInfoGridConfig? themeData}) =>
    themeData?.valueTextStyle.generateTextStyle();
