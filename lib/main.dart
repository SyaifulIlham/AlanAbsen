import 'package:flutter/material.dart';
import 'package:AlanAbsen/Splash.dart';
import 'package:AlanAbsen/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Splash(),
    MyHomePage(title: 'Home Page')
    // HalamanLain(),
    // HalamanLain2(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alan Creative',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 156)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _screens[
            _currentIndex], // Tampilkan halaman sesuai dengan indeks terpilih
      ),
    );
  }
}
