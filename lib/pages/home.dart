import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pressedTime = '';
  String _pressedTime2 = '';
  bool _isBorderVisible = true;
  bool _isBorderVisible2 = true;
  bool _isMasukPressed = false;
  bool _isKeluarPressed = false;

  void _onMasukPressed() {
    setState(() {
      _pressedTime =
          '${DateTime.now().hour.toString().padLeft(2, '0')}.${DateTime.now().minute.toString().padLeft(2, '0')}';
      _isBorderVisible = false;
      _isMasukPressed = true;
    });
  }

  void _onKeluarPressed() {
    setState(() {
      if (!_isKeluarPressed) {
        _pressedTime2 =
            '${DateTime.now().hour.toString().padLeft(2, '0')}.${DateTime.now().minute.toString().padLeft(2, '0')}';
        _isBorderVisible2 = false;
        _isKeluarPressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 450,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 270,
            child: Container(
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '27', // Angka
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        'Tepat Waktu',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 15,
                      height: 40,
                      child: VerticalDivider(
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '27', // Angka
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        'Telat Hadir',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 10,
                      height: 40,
                      child: VerticalDivider(
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '27', // Angka
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        'Izin & Cuti',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 340,
            right: 12,
            left: 12,
            child: SizedBox(
              width: 384,
              height: 320,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      /*Card Absen*/
                      width: 382,
                      height: 81,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      child: Row(
                        /* row box absen*/
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Container(
                              width: 64,
                              height: 54,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromRGBO(114, 190, 66, 1),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '24',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sen',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            /**masuk */
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: GestureDetector(
                              onTap: () {
                                if (!_isMasukPressed) {
                                  _onMasukPressed();
                                }
                              },
                              child: Container(
                                width: 71,
                                height: 60,
                                decoration: _isBorderVisible
                                    ? BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: const Color.fromRGBO(
                                            226, 238, 255, 0.6),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 172, 238, 1),
                                          width: 2,
                                        ),
                                      )
                                    : null,
                                child: Center(
                                  child: _pressedTime.isEmpty
                                      ? const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.touch_app,
                                              color: Color.fromRGBO(
                                                  0, 172, 238, 1),
                                            ),
                                            Text(
                                              'masuk',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      0, 172, 238, 1)),
                                            )
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Masuk',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      206, 206, 206, 1)),
                                            ),
                                            Text(
                                              _pressedTime,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                          /* masuk ends here */
                          const SizedBox(width: 10, height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 50,
                              child: VerticalDivider(width: 10, thickness: 2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            /* keluar */
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: GestureDetector(
                              onTap: _isMasukPressed ? _onKeluarPressed : null,
                              child: Container(
                                width: 71,
                                height: 60,
                                decoration: _isBorderVisible2
                                    ? BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: _isMasukPressed
                                            ? (_isBorderVisible2
                                                ? const Color.fromRGBO(
                                                    226, 238, 255, 0.1)
                                                : const Color.fromRGBO(
                                                    248, 248, 248, 0.1))
                                            : const Color.fromRGBO(248, 248, 248,
                                                0.2), // Menyesuaikan warna container
                                        border: Border.all(
                                          color: _isMasukPressed
                                              ? (_isBorderVisible2
                                                  ? const Color.fromRGBO(
                                                      0, 172, 238, 1)
                                                  : Colors.grey)
                                              : const Color.fromRGBO(
                                                  187,
                                                  187,
                                                  187,
                                                  1), // Menyesuaikan warna border
                                          width: 2,
                                        ),
                                      )
                                    : null,
                                child: Center(
                                  child: _pressedTime2.isEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.touch_app,
                                              color: _isMasukPressed
                                                  ? const Color.fromRGBO(
                                                      0, 172, 238, 1)
                                                  : const Color.fromRGBO(
                                                      187, 187, 187, 1),
                                            ),
                                            Text(
                                              'keluar',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: _isMasukPressed
                                                      ? const Color.fromRGBO(
                                                          0, 172, 238, 1)
                                                      : const Color.fromRGBO(
                                                          187, 187, 187, 1)),
                                            )
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'keluar',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      206, 206, 206, 1)),
                                            ),
                                            Text(
                                              _pressedTime2,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*1 card absen end */
                    const SizedBox(height: 20),
                    Container(
                      /*Card Absen*/
                      width: 382,
                      height: 81,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      child: Row(
                        /* row box absen*/
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Container(
                              width: 64,
                              height: 54,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromRGBO(114, 190, 66, 1),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '24',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sen',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Masuk',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20, height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 50,
                              child: VerticalDivider(width: 10, thickness: 2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Keluar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      /*Card Absen*/
                      width: 382,
                      height: 81,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      child: Row(
                        /* row box absen*/
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Container(
                              width: 64,
                              height: 54,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromRGBO(114, 190, 66, 1),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '24',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sen',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Masuk',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20, height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 50,
                              child: VerticalDivider(width: 10, thickness: 2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Keluar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      /*Card Absen*/
                      width: 382,
                      height: 81,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      child: Row(
                        /* row box absen*/
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Container(
                              width: 64,
                              height: 54,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromRGBO(114, 190, 66, 1),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '24',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sen',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Masuk',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20, height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 50,
                              child: VerticalDivider(width: 10, thickness: 2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Keluar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(206, 206, 206, 1)),
                                ),
                                Text(
                                  '18.00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 160,
            right: 12,
            left: 12,
            child: Container(
              width: 340,
              height: 81,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 12),
                        child: Text(
                          'Senin, 26 Desember 2022',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.watch_later_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1),
                            child: Text('Jam Lembur 18:00 WIB'),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol Absen ditekan
                      },
                      child: const Text('Absen'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 96,
            right: 12,
            left: 12,
            child: Container(
              width: 340,
              height: 51,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20, top: 5),
                        child: Text(
                          'GRAHA MANDIRI, Jl. Tugu Raya, Tugu, Cimanggis,',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'Depok City',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 12,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        'Deni Juli Setiawan',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Web Developer',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () {
                      // Aksi ketika tombol Notifikasi ditekan
                    },
                    icon: const Icon(
                      Icons.notification_add_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
