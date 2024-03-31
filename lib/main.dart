import 'package:flutter/material.dart';
import 'package:AlanAbsen/Splash.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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