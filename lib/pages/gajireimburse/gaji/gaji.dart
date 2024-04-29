import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'popup_gaji.dart'; // Import file popup.dart

String namaPegawai = 'John Doe'; // Ubah nama pegawai sesuai kebutuhan
String unitKerja = 'Bagian Keuangan';
String totalGaji = '10.000.000'; // Tambahkan nilai total gaji sesuai kebutuhan
String statusGaji = 'diproses'; // Ubah unit kerja sesuai kebutuhan

class GajiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          // Baris pertama untuk memilih tipe pegawai atau magang
          Row(
            children: [
              Expanded(
                child: _buildEmployeeTypeSelector(), // Widget seleksi tipe
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: _buildDateSelector(context), // Widget pemilih tanggal
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Menambahkan widget untuk informasi gaji
          _buildSalaryInfoCard(
            status: 'Belum Lunas', // Ganti status dan tanggal sesuai kebutuhan
            date: '30 April 2024', // Ganti tanggal sesuai kebutuhan
            context: context, // Tambahkan BuildContext di sini
          ),
        ],
      ),
    );
  }
}

// Fungsi untuk membangun widget seleksi tipe pegawai atau magang
Widget _buildEmployeeTypeSelector() {
  String? selectedType;
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Pilih Tipe', // Ubah hint text sesuai kebutuhan
        border: InputBorder.none, // Hilangkan border bawaan DropdownButtonFormField
        prefixIcon: Icon(Icons.person), // Icon di bagian kiri
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0), // Atur padding secara manual untuk penyesuaian
      ),
      value: selectedType,
      onChanged: (String? newValue) {
        selectedType = newValue!;
      },
      items: <String>['Pegawai', 'Magang'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}

// Fungsi untuk membangun widget pemilih tanggal
Widget _buildDateSelector(BuildContext context) {
  return GestureDetector(
    onTap: () {
      _selectDate(context); // Panggil fungsi untuk memilih tanggal
    },
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Text(
            'Pilih Tanggal', // Ubah teks sesuai kebutuhan
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(width: 10.0), // Spasi antara teks dan ikon
          Icon(Icons.calendar_today),
        ],
      ),
    ),
  );
}

// Fungsi untuk memilih tanggal
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Tanggal awal yang ditampilkan
    firstDate: DateTime(2020), // Tanggal pertama yang dapat dipilih
    lastDate: DateTime(2101), // Tanggal terakhir yang dapat dipilih
  );
  if (picked != null) {
    // Lakukan sesuatu dengan tanggal yang dipilih
    print('Tanggal yang dipilih: $picked');
  }
}

// Fungsi untuk membangun card informasi gaji
Widget _buildSalaryInfoCard({
  required String status,
  required String date,
  required BuildContext context, // Tambahkan BuildContext sebagai parameter
}) {
  return InkWell(
    onTap: () {
      showDetailPopup(status, date, context); // Gunakan fungsi dari file popup.dart
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
                  SizedBox(height: 15.0),
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
                            SizedBox(height: 4.0),
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
                              'Tanggal Gajian',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
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
                            SizedBox(height: 4.0),
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
                              'Total Gaji',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            SizedBox(height: 4.0),
                            Text(
                              '$totalGaji',
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
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        255,
                        230,
                        0,
                      ), // Warna latar belakang container
                      borderRadius:
                          BorderRadius.circular(5.0), // Radius border container
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ), // Padding container
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
          ],
        ),
      ),
    ),
  );
}