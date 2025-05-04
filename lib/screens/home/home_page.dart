//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/29
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:icoffee/app_colors.dart';
import 'package:icoffee/app_constants.dart';
import 'package:icoffee/widgets/detail_card.dart';
import 'package:icoffee/widgets/enhance_number_card.dart';

/// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: BrnAppBar(
            automaticallyImplyLeading: false,
            title: AppConstants.appName,
          ),
          body: Column(
            children: [
              _header(),
              Expanded(
                child: TabBarView(
                  children: [
                    _drinkLogs(),
                    _emptyContent(),
                  ],
                ),
              ),
            ],
          )),
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
                number: '2',
                lastDesc: "次",
                title: '冲煮次数',
              ),
              FNumberInfoItemModel(
                number: '1',
                lastDesc: "种",
                title: '豆种',
              ),
              FNumberInfoItemModel(
                number: '30.0',
                lastDesc: "克",
                title: '剩余',
              ),
              FNumberInfoItemModel(
                number: '150',
                lastDesc: "天",
                title: '距上次使用',
              ),
            ],
          ),
          BrnLine(),
          BrnTabBar(
            tabs: [
              BadgeTab(
                text: "饮用记录",
              ),
              BadgeTab(
                text: "冷萃记录",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drinkLogs() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return FDetailCard(
            onPressed: () {
              print('2233');
            },
            onMore: () {
              print('more');
            },
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "标题",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "2022-03-25 15:05",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
            content: BrnRichInfoGrid(
              pairInfoList: [
                BrnRichGridInfo('冲煮: ', '法压壶'),
                BrnRichGridInfo('研磨: ', '共享'),
                BrnRichGridInfo('粉水比: ', '1：1.0'),
                BrnRichGridInfo('研磨度: ', '85'),
              ],
            ),
            bottom: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BrnSmallOutlineButton(
                    title: 'SCAA品鉴',
                    textColor: AppColors.deactivatedText,
                    onTap: () {
                      print('SCAA品鉴');
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BrnSmallOutlineButton(
                    title: '杯测',
                    textColor: AppColors.deactivatedText,
                    onTap: () {
                      print('杯测');
                    },
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 2,
      ),
    );
  }

  Widget _emptyContent() {
    return const Center(
      child: Text("开始您的品咖之旅吧~"),
    );
  }
}
