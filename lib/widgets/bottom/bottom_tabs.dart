import 'package:flutter/material.dart';
import 'package:tiger/views/src/homepage/home_screen.dart';
import 'package:tiger/views/src/profile/profile_screen.dart';
import 'package:tiger/views/src/search/search_screen.dart';


class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const HomeScreen(),
      icon: const Icon(Icons.home),
      title: const Text("Home"),
    ),
    TabNavigationItem(
      page: const SearchScreen(),
      icon: const Icon(Icons.search),
      title: const Text("Search"),
    ),
    TabNavigationItem(
      page: const ProfileScreen(),
      icon: const Icon(Icons.account_balance),
      title: const Text("Home"),
    ),
    TabNavigationItem(
      page: const HomeScreen(),
      icon: const Icon(Icons.supervised_user_circle),
      title: const Text("Mention"),
    ),
    TabNavigationItem(
      page: const SearchScreen(),
      icon: const Icon(Icons.account_balance),
      title: const Text("Search"),
    ),
  ];
}