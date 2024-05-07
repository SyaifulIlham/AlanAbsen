import 'package:AlanAbsen/pages/gajireimburse/reimburse/popup_reimburse.dart';
import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/gajireimburse/reimburse/ajukan_reimburse.dart';

String namaPegawai = 'John Doe';
String unitKerja = 'Bagian Keuangan';
String nominal = '10.000.000';
String statusGaji = 'diproses';
String jenis = 'Uang Makan';

class ReimbursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildEmployeeTypeSelector(),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: _buildTypeSelector(),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          _buildSalaryInfoCard(
            status: 'Belum Lunas',
            date: '30 April 2024',
            context: context,
          ),
          SizedBox(height: 320.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AjukanReimbursePage(),
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
              'Ajukan Reimburse',
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

Widget _buildEmployeeTypeSelector() {
  String? selectedType;
  return Container(
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Status',
        border: InputBorder.none,
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 14.0,
        ),
      ),
      value: selectedType,
      onChanged: (String? newValue) {
        selectedType = newValue!;
      },
      items: <String>['Diproses', 'Diterima', 'Ditolak', 'Lihat Semua']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}

Widget _buildTypeSelector() {
  String? selectedType;
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: SizedBox(
      width: 150, // Batas lebar maksimal untuk dropdown
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: 'Jenis',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.category),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 3.0,
          ),
        ),
        value: selectedType,
        onChanged: (String? newValue) {
          selectedType = newValue!;
        },
        items: <String>['Uang transport', 'Biaya Server', 'Lainnya']
          .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}

Widget _buildSalaryInfoCard({
  required String status,
  required String date,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      showDetailPopup(status, date, context);
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
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Pegawai',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$namaPegawai',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$jenis',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unit Kerja',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$unitKerja',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nominal',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$nominal',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                             ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Text(
                                '$status',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dibuat Tanggal',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$date',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    ),
  );
}
