import 'package:flutter/material.dart';
import 'package:AlanAbsen/absen/maps.dart';
import 'package:AlanAbsen/pages/home.dart'; // Import homePage.dart

class presesniPage extends StatelessWidget {
  const presesniPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 600,
            width: 360,
            child: MapsPage(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 560),
            child: Container(
              height: 200,
              width: 360,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () {
                        // Navigasi ke homePage.dart ketika tombol ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue[
                                600]!), // Mengubah warna tombol menjadi biru600
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        minimumSize: MaterialStateProperty.all<Size>(const Size(
                            300, 40)), // Menetapkan lebar minimum 70px
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Absen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      children: [
                        Container(
                            height: 63,
                            width: 212,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(196, 196, 196, 0.498)),
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text('jam Masuk'),
                                      Text('13.00')
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
