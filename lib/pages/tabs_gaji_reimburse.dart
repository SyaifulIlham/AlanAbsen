import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/gajireimburse/reimburse/reimburse.dart'; 
import 'package:AlanAbsen/pages/gajireimburse/gaji/gaji.dart'; // Import AjukanGajiButton

class GajiReimburse extends StatefulWidget {
  const GajiReimburse({Key? key}) : super(key: key);

  @override
  _GajiReimburseState createState() => _GajiReimburseState();
}

class _GajiReimburseState extends State<GajiReimburse> {
  Color leftButtonTextColor = Colors.blue; // Atur warna tab Gaji menjadi aktif secara default
  Color rightButtonTextColor = Colors.black;
  bool additionalButtonVisibleGaji = true;
  bool additionalButtonVisibleReimburse = false;

  Color leftButtonBorderColor = Colors.blue;
  Color rightButtonBorderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    // Set state sesuai dengan tab yang ingin dibuka secara otomatis
    setState(() {
      additionalButtonVisibleGaji = true;
      additionalButtonVisibleReimburse = false;
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
                      'Gaji & Reimburse',
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
                                  additionalButtonVisibleGaji = true;
                                  additionalButtonVisibleReimburse = false;
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
                                      'Gaji',
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
                                  additionalButtonVisibleReimburse = true;
                                  additionalButtonVisibleGaji = false;
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
                                      'Reimburse',
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
                      if (additionalButtonVisibleGaji ||
                          additionalButtonVisibleReimburse)
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(height: 20.0),
                              
                              if (additionalButtonVisibleGaji)
                                GajiPage(), // Gunakan widget GajiPage
                              if (additionalButtonVisibleReimburse)
                                ReimbursePage(), // Gunakan widget ReimbursePage
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
