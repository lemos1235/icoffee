//
// [Author] lg (https://github.com/lemos1235)
// [Date] 8/23/2022
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

/// 统计页
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        automaticallyImplyLeading: false,
        title: "统计",
        actions: const Icon(
          Icons.sync_rounded,
          color: Color(0xFF616161),
        ),
      ),
      body: const Center(
        child: Text("暂无数据"),
      ),
    );
  }
}
