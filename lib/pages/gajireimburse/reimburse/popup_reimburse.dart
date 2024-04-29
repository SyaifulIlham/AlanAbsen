import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/gajireimburse/reimburse/edit_reimburse.dart';

void showDetailPopup(
  String status,
  String date,
  BuildContext context,
) {
  String namaPegawai = 'John Doe';
  String unitKerja = 'Bagian Keuangan';
  String jenis = 'uang makan'; // Contoh total gaji
  double nominal = 4000000.0; // Contoh gaji pokok

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
                      Text('Jenis Izin:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$jenis',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
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
                      Text('dDibuat tanggal:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$date',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gaji Pokok:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$nominal',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              // Tambahkan gambar di sini
              Image.asset(
                'assets/images/example.png', // Ganti dengan path gambar yang sesuai
                width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
                height: 100, // Sesuaikan tinggi gambar sesuai kebutuhan
                fit: BoxFit.cover,
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
                          builder: (context) => EditReimburse(),
                        ),
                      );
                    },
                    child: Text('Edit'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
