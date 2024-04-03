import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/izincuti/izin/izin.dart';
import 'package:AlanAbsen/pages/izincuti/cuti/cuti.dart';


class IzinCutiPage extends StatefulWidget {
  const IzinCutiPage({Key? key}) : super(key: key);

  @override
  _IzinCutiPageState createState() => _IzinCutiPageState();
}

class _IzinCutiPageState extends State<IzinCutiPage> {
  Color leftButtonTextColor = Colors.black;
  Color rightButtonTextColor = Colors.black;
  bool additionalButtonVisibleIzin = false;
  bool additionalButtonVisibleCuti = false;

  Color leftButtonBorderColor = Colors.transparent;
  Color rightButtonBorderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(00.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0), // Padding kiri untuk teks "Izin & Cuti"
                    child: Text(
                      'Izin & Cuti',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  leftButtonTextColor = Colors.blue;
                                  rightButtonTextColor = Colors.black;
                                  leftButtonBorderColor = Colors.blue;
                                  rightButtonBorderColor = Colors.transparent;
                                  additionalButtonVisibleIzin = true;
                                  additionalButtonVisibleCuti = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: leftButtonBorderColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      'Izin',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: leftButtonTextColor,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  rightButtonTextColor = Colors.blue;
                                  leftButtonTextColor = Colors.black;
                                  rightButtonBorderColor = Colors.blue;
                                  leftButtonBorderColor = Colors.transparent;
                                  additionalButtonVisibleCuti = true;
                                  additionalButtonVisibleIzin = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: rightButtonBorderColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      'Cuti',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: rightButtonTextColor,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (additionalButtonVisibleIzin ||
                          additionalButtonVisibleCuti)
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(height: 400),
                              if (additionalButtonVisibleIzin)
                                Padding(
                                  padding: const EdgeInsets.all(
                                      8.0), // Tambahkan padding di sini
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const IzinPage(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      side: BorderSide(
                                        width: 0,
                                        color: Colors.blue,
                                      ),
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.blue,
                                      minimumSize: Size(double.infinity, 50),
                                    ),
                                    child: Text(
                                      'Ajukan Izin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              if (additionalButtonVisibleCuti)
                                Padding(
                                  padding: const EdgeInsets.all(
                                      8.0), // Tambahkan padding di sini
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const CutiPage(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      side: BorderSide(
                                        width: 0,
                                        color: Colors.blue,
                                      ),
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.blue,
                                      minimumSize: Size(double.infinity, 50),
                                    ),
                                    child: Text(
                                      'Ajukan Cuti',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
