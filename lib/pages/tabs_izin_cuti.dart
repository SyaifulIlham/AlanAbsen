import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/izincuti/izin/izin.dart'; 
import 'package:AlanAbsen/pages/izincuti/cuti/cuti.dart'; // Import AjukanIzinButton

class IzinCutiTabs extends StatefulWidget {
  const IzinCutiTabs({Key? key}) : super(key: key);

  @override
  _IzinCutiTabsState createState() => _IzinCutiTabsState();
}

class _IzinCutiTabsState extends State<IzinCutiTabs> {
  Color leftButtonTextColor = Colors.blue; // Atur warna tab Izin menjadi aktif secara default
  Color rightButtonTextColor = Colors.black;
  bool additionalButtonVisibleIzin = true;
  bool additionalButtonVisibleCuti = false;

  Color leftButtonBorderColor = Colors.blue;
  Color rightButtonBorderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    // Set state sesuai dengan tab yang ingin dibuka secara otomatis
    setState(() {
      additionalButtonVisibleIzin = true;
      additionalButtonVisibleCuti = false;
    });
  }

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
                    padding: const EdgeInsets.only(left: 20.0),
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
                              const SizedBox(height: 20.0),
                              
                              if (additionalButtonVisibleIzin)
                                IzinPage(), // Gunakan widget IzinPage
                              if (additionalButtonVisibleCuti)
                                CutiPage(), // Gunakan widget CutiPage
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