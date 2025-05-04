//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icoffee/screens/beans/beans_page.dart';
import 'package:icoffee/screens/home/home_page.dart';
import 'package:icoffee/screens/statistics/statistics_page.dart';
import 'package:icoffee/screens/user/user_page.dart';
import 'package:icoffee/widgets/bottom_app_bar.dart';

/// 主页
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;

  int _currentPage = 0;

  final List<Widget> _pages = [const HomePage(), const StatisticsPage(), const BeansPage(), const UserPage()];

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          "assets/icons/coffee.svg",
          color: Colors.white,
          width: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  void navigationTapped(int page) {
    _pageController!.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  void onPageChanged(int page) async {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _bottomAppBar() {
    List<FBottomNavigationTileItem> items = [
      FBottomNavigationTileItem(const Icon(Icons.home), "首页"),
      FBottomNavigationTileItem(const Icon(Icons.auto_graph), "统计"),
      FBottomNavigationTileItem(const Icon(Icons.inventory_2), "咖啡豆"),
      FBottomNavigationTileItem(const Icon(Icons.account_circle), "我"),
    ];
    var tiles = items.mapIndexed((index, item) {
      return FBottomNavigationTile(
        item.icon,
        item.label,
        selected: _currentPage == index,
        onTap: () {
          navigationTapped(index);
        },
        enableFeedback: true,
      );
    }).toList();
    return FBottomAppBar(
      children: [
        tiles[0],
        tiles[1],
        const SizedBox(
          width: 70,
        ),
        tiles[2],
        tiles[3],
      ],
    );
  }
}
