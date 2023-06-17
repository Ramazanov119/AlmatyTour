import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:AlmatyTour/Pages/TourPage.dart';
import 'package:AlmatyTour/Pages/HomePage.dart';
import 'package:AlmatyTour/Pages/ProfilePage.dart';
import 'package:AlmatyTour/Pages/SosPage.dart';
import 'package:AlmatyTour/Pages/HotelPage.dart';

import 'EmbassyPage.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  List _pages = [
    HomePage(),
    CategoryTours(),
    SosPage(),
    HotelPage(),
    EmbassyPage(),
    ProfilePage()
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Tours",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2 ? Icons.sos : Icons.sos,
                color: Colors.red,
              ),
              label: "Sos Screen",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ? Icons.hotel : Icons.hotel),
              label: "Hotel Screen",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 4 ? Icons.flag : Icons.flag_sharp),
              label: "Embassy Screen",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 5 ? IconlyBold.user2 : IconlyLight.user2),
              label: "Profile Screen",
            ),
          ]),
    );
  }
}
