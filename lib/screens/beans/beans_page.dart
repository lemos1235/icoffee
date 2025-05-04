//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee/app_colors.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/widgets/detail_card.dart';
import 'package:icoffee/widgets/enhance_number_card.dart';
import 'package:icoffee/widgets/rich_info_grid.dart';

/// 咖啡豆页
class BeansPage extends StatefulWidget {
  const BeansPage({Key? key}) : super(key: key);

  @override
  State<BeansPage> createState() => _BeansPageState();
}

class _BeansPageState extends State<BeansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        automaticallyImplyLeading: false,
        title: "咖啡豆",
        actions: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.beans);
          },
          child: const Icon(Icons.add, size: 24, color: AppColors.deactivatedText),
        ),
      ),
      body: Column(
        children: [
          _header(),
          Expanded(child: _beanList()),
        ],
      ),
    );
  }

  Widget _header() {
    return BrnShadowCard(
      child: Column(
        children: <Widget>[
          BrnLine(),
          FEnhanceNumberCard(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            rowCount: 4,
            itemChildren: [
              FNumberInfoItemModel(
                number: '1',
                lastDesc: "种",
                title: '豆种',
              ),
              FNumberInfoItemModel(
                number: '0',
                lastDesc: "元",
                title: '总价值',
              ),
              FNumberInfoItemModel(
                number: '30.0',
                lastDesc: "克",
                title: '剩余',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _beanList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return FDetailCard(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.beansDetail);
            },
            onMore: () {
              print('more');
            },
            title: const Text(
              "标题",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: FRichInfoGrid(
              direction: Axis.vertical,
              pairInfoList: [
                BrnRichGridInfo('烘焙程度', '--'),
                BrnRichGridInfo('豆种', '--'),
                BrnRichGridInfo('产地', '--'),
                BrnRichGridInfo('工艺', '--'),
                BrnRichGridInfo('烘焙至今', '152天'),
                BrnRichGridInfo('剩余', '0克'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 1,
      ),
    );
  }
}
