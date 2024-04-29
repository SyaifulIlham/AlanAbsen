import 'package:flutter/material.dart';
import 'slip_gaji.dart'; // Import halaman EditGajiPage

void showDetailPopup(
  String status,
  String date,
  BuildContext context,
) {
  String namaPegawai = 'John Doe';
  String unitKerja = 'Bagian Keuangan';
  double totalGaji = 5000000.0; // Contoh total gaji
  double gajiPokok = 4000000.0; // Contoh gaji pokok
  double tambahan = 1000000.0; // Contoh tambahan
  double pengurangan = 500000.0; // Contoh pengurangan

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          'Detail Gaji',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Pegawai:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$namaPegawai',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanggal Gajian:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$date',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Unit Kerja:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$unitKerja',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      SizedBox(height: 4.0),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 230, 0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            '$status',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: status == 'Belum Lunas' ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Gaji:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$totalGaji',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gaji Pokok:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$gajiPokok',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengurangan :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$pengurangan',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.red),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Tambahan:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$tambahan',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Tutup',
                      style: TextStyle(color: Colors.red),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SlipGaji(),
                        ),
                      );
                    },
                    child: Text('Unduh Slip Gaji'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
