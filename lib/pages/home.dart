import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00ACEE), // Ubah warna latar belakang Scaffold
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 132,
              height: 51,
              color: const Color.fromRGBO(
                  255, 255, 255, 0.2), // Warna putih dengan transparansi 20%
              child: const Center(
                child: Text(
                  'Top Container',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              width: 132,
              height: 51,
              color: const Color.fromRGBO(
                  255, 255, 255, 0.2), // Warna putih dengan transparansi 20%
              child: const Center(
                child: Text(
                  'Bottom Container',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
