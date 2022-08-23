import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:icoffee/pages/nav_pages/beans_page.dart';
import 'package:icoffee/pages/nav_pages/home_page.dart';
import 'package:icoffee/pages/nav_pages/statistics_page.dart';
import 'package:icoffee/pages/nav_pages/user_page.dart';

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
          CoffeeBeansPage(),
          StatisticsPage(),
          KeepAliveWrapper(child: UserPage()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: '统计',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: '咖啡豆',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我',
          ),
        ],
        onTap: navigationTapped,
        currentIndex: currentPage,
      ),
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
}
