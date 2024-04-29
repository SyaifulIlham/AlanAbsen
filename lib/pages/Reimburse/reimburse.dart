import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/Reimburse/ajukanreimburse.dart';

class ReimbursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dropdown status dengan opsi Diproses, Diterima, Ditolak, dan Lihat Semua
    final statusItems = ['Diproses', 'Diterima', 'Ditolak', 'Lihat Semua'];

    // Dropdown jenis dengan opsi Biaya Transport, Biaya Server, dll.
    final jenisItems = ['Biaya Transport', 'Biaya Server', 'Biaya Lainnya'];

    String selectedStatus = statusItems[0]; // Pilihan default
    String selectedJenis = jenisItems[0]; // Pilihan default

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          // Layout Row untuk dropdown status dan jenis
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Dropdown Status
              Expanded(
                child: DropdownButton<String>(
                  value: selectedStatus,
                  items: statusItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle perubahan dropdown status
                    selectedStatus = newValue ?? statusItems[0];
                  },
                  isExpanded: true,
                ),
              ),
              const SizedBox(width: 10.0),
              // Dropdown Jenis
              Expanded(
                child: DropdownButton<String>(
                  value: selectedJenis,
                  items: jenisItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle perubahan dropdown jenis
                    selectedJenis = newValue ?? jenisItems[0];
                  },
                  isExpanded: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Menampilkan teks "Data Reimburse Kosong"
          Text(
            'Data Reimburse Kosong',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 420.0),
          // Tombol untuk mengajukan reimburse
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
