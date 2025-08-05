import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/features/Wishlist/ui/screen/wish_list_screen.dart';
import 'package:my_suit/features/category/ui/screen/category_screen.dart';
import 'package:my_suit/features/home/ui/screen/home_screen.dart';
import 'package:my_suit/features/profile/ui/screen/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: LocaleKeys.categories.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: LocaleKeys.wishlist.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
    );
  }
}
