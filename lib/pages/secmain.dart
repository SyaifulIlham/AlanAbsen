import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import 'package:AlanAbsen/pages/home.dart';
import 'package:AlanAbsen/pages/absen.dart';
import 'package:AlanAbsen/pages/gaji.dart';
import 'package:AlanAbsen/pages/izin.dart';
import 'package:AlanAbsen/pages/profile.dart';

void main() {
  runApp(Secmain());
}

class Secmain extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.access_time),
        title: 'Absen',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.attach_money),
        title: 'Gaji',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.verified_user),
        title: 'Izin',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      AbsenPage(),
      GajiPage(),
      IzinPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
