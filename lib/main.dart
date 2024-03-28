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
      home: const Splash(), // Menampilkan SplashScreen pada awal aplikasi
    );
  }
}