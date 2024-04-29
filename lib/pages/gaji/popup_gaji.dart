import 'package:AlanAbsen/pages/izincuti/izin/edit_izin.dart';
import 'package:flutter/material.dart';
import 'widgetgaji.dart';

void showDetailPopup(
  String status,
  String date,
  String reason,
  String type,
  BuildContext context,
) {
  String tanggal = '22 April 2024';
  String unitKerja = 'Web Developer';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          'Detail $type',
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
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('tanggal:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$tanggal',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Unit Kerja:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('$unitKerja',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
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
                      color: status == 'Diproses' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'nama pegawai',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  SizedBox(width: 4.0),
                ],
              ),
              Text(
                '$date',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  SizedBox(width: 4.0),
                ],
              ),
              Text(
                '$reason',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              // Bukti berupa gambar
              Text(
                'Bukti:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              SizedBox(height: 4.0),
              // Ganti dengan widget Image sesuai dengan gambar yang ingin ditampilkan
              Image.asset(
                'assets/images/bukti_izin.jpg',
                width: 150,
                height: 150,
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (type == 'Izin') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditIzinPage(),
                          ),
                        );
                      }
                    },
                    child: Text('Edit'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
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
