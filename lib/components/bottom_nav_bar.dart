import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends BottomNavigationBar {
  CustomBottomNavBar({super.key})
      : super(
          backgroundColor: Colors.grey.shade900,
          items: item,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: 0,
        );

  static const List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Ana Sayfa"),
    BottomNavigationBarItem(
        activeIcon: Icon(CupertinoIcons.compass_fill),
        icon: Icon(CupertinoIcons.compass),
        label: "Keşfet"),
    BottomNavigationBarItem(
        icon: Icon(Icons.library_music_outlined),
        activeIcon: Icon(Icons.library_music),
        label: "Kitaplık"),
  ];
}
