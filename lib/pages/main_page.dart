import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icoffee/pages/beans/beans_page.dart';
import 'package:icoffee/pages/home/home_page.dart';
import 'package:icoffee/pages/statistics/statistics_page.dart';
import 'package:icoffee/pages/user/user_page.dart';
import 'package:icoffee/widgets/gf_bottom_app_bar.dart';

/// 主页
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController? _pageController;

  int _currentPage = 0;

  final List<Widget> _pages = [HomePage(), StatisticsPage(), CoffeeBeansPage(), UserPage()];

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
    List<GFBottomNavigationTileItem> items = [
      GFBottomNavigationTileItem(Icon(Icons.home), "首页"),
      GFBottomNavigationTileItem(Icon(Icons.auto_graph), "统计"),
      GFBottomNavigationTileItem(Icon(Icons.inventory_2), "咖啡豆"),
      GFBottomNavigationTileItem(Icon(Icons.account_circle), "我"),
    ];
    var tiles = items.mapIndexed((index, item) {
      return GFBottomNavigationTile(
        item.icon,
        item.label,
        selected: _currentPage == index,
        onTap: () {
          navigationTapped(index);
        },
        enableFeedback: true,
      );
    }).toList();
    return GFBottomAppBar(
      children: [
        tiles[0],
        tiles[1],
        SizedBox(
          width: 70,
        ),
        tiles[2],
        tiles[3],
      ],
    );
  }
}
