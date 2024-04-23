import 'package:flutter/material.dart';
import 'cuti.dart';
import 'popup_cuti.dart';
import 'ajukan_cuti.dart'; // Import file popup.dart

int sisaCuti = 10;
int cutiDiproses = 2;
int cutiTerpakai = 8;

class CutiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 120, // Atur lebar kotak sisa cuti
                    height: 60, // Atur tinggi kotak sisa cuti
                    color: Color.fromRGBO(0, 171, 238, 0.06),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$sisaCuti',
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 172, 238, 1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Sisa Cuti',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: 120, // Atur lebar kotak cuti diproses
                    height: 60, // Atur tinggi kotak cuti diproses
                    color: Color.fromRGBO(242, 184, 37, 0.12),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$cutiDiproses',
                            style: TextStyle(
                              color: const Color.fromRGBO(251, 192, 42, 1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Cuti Diproses',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: 120, // Atur lebar kotak cuti terpakai
                    height: 60, // Atur tinggi kotak cuti terpakai
                    color: const Color.fromRGBO(255, 92, 88, 0.1),
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$cutiTerpakai',
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 92, 88, 1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Cuti Terpakai',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          // Menambahkan widget untuk informasi cuti yang diproses
          _buildLeaveInfoCard(
            status:
                'Diproses', // Ganti status, tanggal, dan alasan sesuai kebutuhan
            date: '4 April 2024 - 5 April 2040',
            reason: 'Sakit perut',
            type: 'Cuti',
            context: context, // Tambahkan BuildContext di sini
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AjukanCutiPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              side: BorderSide(
                width: 0,
                color: Colors.blue,
              ),
              backgroundColor: Colors.blue,
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
        ],
      ),
    );
  }
}

// Fungsi untuk membangun card informasi cuti yang diproses
Widget _buildLeaveInfoCard({
  required String status,
  required String date,
  required String reason,
  required String type,
  required BuildContext context, // Tambahkan BuildContext sebagai parameter
}) {
  // Variabel tambahan untuk nama pegawai dan unit kerja
  String namaPegawai = 'John Doe';
  String unitKerja = 'Bagian Keuangan';

  return InkWell(
    onTap: () {
      showDetailPopup(status, date, reason, type,
          context); // Gunakan fungsi dari file popup.dart
    },
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 230, 0), // Warna latar belakang container
                      borderRadius:
                          BorderRadius.circular(5.0), // Radius border container
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0), // Padding container
                    child: Text(
                      '$status',
                      textAlign: TextAlign
                          .center, // Atur alignment teks menjadi center
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4.0),
                    ],
                  ),
                  Text('$date'), // Tanggal diletakkan di baris berikutnya
                  SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keterangan',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4.0),
                    ],
                  ),
                  Text('$reason'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
