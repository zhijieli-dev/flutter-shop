import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Cart/index.dart';
import 'package:flutter_shop/pages/Category/index.dart';  
import 'package:flutter_shop/pages/Home/index.dart';
import 'package:flutter_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Map<String, String>> iconList = [
    {
      'icon': 'lib/assets/icon.webp',
      'activeIcon': 'lib/assets/icon.webp',
      'title': 'Home'
    },
    {
      'icon': 'lib/assets/icon.webp',
      'activeIcon': 'lib/assets/icon.webp',
      'title': 'Category'
    },
    {
      'icon': 'lib/assets/icon.webp',
      'activeIcon': 'lib/assets/icon.webp',
      'title': 'Cart'
    },
    {
      'icon': 'lib/assets/icon.webp',
      'activeIcon': 'lib/assets/icon.webp',
      'title': 'Mine'
    }
  ];

  List<BottomNavigationBarItem> _getBottomTabWidget() {
    return List.generate(iconList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(iconList[index]['icon']!, width: 24, height: 24),
        activeIcon: Image.asset(iconList[index]['activeIcon']!, width: 24, height: 24),
        label: iconList[index]['title'],
      );
    });
  }

  List<Widget> _getTabWidget() {
    return [
      const HomeView(),
      const CategoryView(),
      const CartView(),
      const MineView() 
    ];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getTabWidget()
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: _getBottomTabWidget(),
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,

      )
    );
  }
}