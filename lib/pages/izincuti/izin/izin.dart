import 'package:flutter/material.dart';
import 'edit_izin.dart'; // Import halaman EditIzinPage
import 'izin.dart'; // Import halaman IzinPage
import 'popup_izin.dart'; // Import file yang berisi fungsi _showDetailPopup
import 'package:intl/intl.dart';
import 'ajukan_izin.dart';

class IzinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          // Menambahkan widget untuk informasi izin yang diproses
          _buildLeaveInfoCard(
            status: 'Diproses', // Ganti status, tanggal, dan alasan sesuai kebutuhan
            date: '20 April 2024 - 20 April 2024',
            reason: 'Pentingnya urusan keluarga',
            type: 'Izin',
            context: context, // Tambahkan BuildContext di sini
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AjukanIzinPage(),
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
              'Ajukan Izin',
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

// Fungsi untuk membangun card informasi izin yang diproses
Widget _buildLeaveInfoCard({
  required String status,
  required String date,
  required String reason,
  required String type,
  required BuildContext context, // Tambahkan BuildContext sebagai parameter
}) {
  return InkWell(
    onTap: () {
      showDetailPopup(status, date, reason, type, context); // Gunakan BuildContext dari argumen fungsi
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$type ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow, // Warna latar belakang container
                          borderRadius: BorderRadius.circular(5.0), // Radius border container
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Padding container
                        child: Text(
                          '$status',
                          style: TextStyle(fontSize: 14.0,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    '$date',
                    style: TextStyle(fontSize: 20.0, // Ukuran teks diperbesar
                      fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Alasan',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '$reason',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
