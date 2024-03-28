import 'dart:async';
import 'package:flutter/material.dart';
import 'package:AlanAbsen/Splash.dart';
import 'package:AlanAbsen/pages/home.dart';
import 'package:AlanAbsen/pages/izin.dart';
import 'package:AlanAbsen/pages/profile.dart';
import 'package:AlanAbsen/pages/gaji.dart';
import 'package:AlanAbsen/pages/absen.dart';
import 'package:flutter/widgets.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alan Creative",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 156)),
        useMaterial3: true,
      ),
      home: Splash(), // Menampilkan SplashScreen pada awal aplikasi
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Setelah 3 detik, pindah ke PersistentTabView
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
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
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      navBarStyle: NavBarStyle.style15, // Choose the style that fits your app
    );
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.business),
        title: 'Absen',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.business),
        title: 'gaji',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.business),
        title: 'Izin',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.business),
        title: 'Profile',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
