import 'package:collection/collection.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icoffee/pages/nav_pages/beans_page.dart';
import 'package:icoffee/pages/nav_pages/home_page.dart';
import 'package:icoffee/pages/nav_pages/statistics_page.dart';
import 'package:icoffee/pages/nav_pages/user_page.dart';
import 'package:icoffee/widgets/gf_bottom_app_bar.dart';

/// 主页
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController? _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: const <Widget>[
          KeepAliveWrapper(child: HomePage()),
          StatisticsPage(),
          CoffeeBeansPage(),
          KeepAliveWrapper(child: UserPage()),
        ],
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

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
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
        selected: currentPage == index,
        onTap: () {
          navigationTapped(index);
        },
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
