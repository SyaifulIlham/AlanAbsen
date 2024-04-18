import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/gajireimburse/reimburse.dart'; // Sesuaikan dengan nama file halaman formulir reimburse

class GajiPage extends StatefulWidget {
  const GajiPage({super.key});

  @override
  _GajiPageState createState() => _GajiPageState();
}

class _GajiPageState extends State<GajiPage> {
  String _selectedStatus = 'status'; // Default status
  DateTime? _selectedDate;
  bool _showReimburseForm = false; // Tambah state untuk menunjukkan apakah formulir reimburse ditampilkan
  bool _showListView = true; // Tambah state untuk menunjukkan apakah ListView harus ditampilkan

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Halaman Gaji'),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min, // Tambahkan ini untuk mengatur ukuran Column sesuai dengan kontennya
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: const Center(
                        child: Text(
                          'Gaji',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: _handleReimburseButtonClick,
                      child: const Center(
                        child: Text(
                          'Reimburse',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
   Row(
  children: [
    Expanded(
      child: DropdownButton<String>(
        value: _selectedStatus,
        onChanged: (String? newValue) {
          setState(() {
            _selectedStatus = newValue!;
          });
        },
        items: <String>['status', 'Lunas', 'Belum Lunas']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child: Text(
                    _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : 'Pilih Tanggal',
                    style: const TextStyle(
                      color: Colors.black, // Ubah warna teks sesuai kebutuhan
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
),
            const SizedBox(height: 20),
            // Widget untuk menampilkan data gaji berdasarkan filter
            if (_showListView)
              SizedBox(
                height: 300, // Atur ketinggian sesuai kebutuhan
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item Gaji $index'),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            // Tambahkan tombol "Ajukan Reimburse"
            if (_showReimburseForm)
              Padding(
                padding: const EdgeInsets.only(top: 350.0),
                child: ElevatedButton(
                  onPressed: _navigateToReimburseForm, // Perbarui aksi tombol untuk menavigasi ke formulir reimburse
                  child: const Text('Ajukan Reimburse'),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

  void _handleReimburseButtonClick() {
    setState(() {
      _showReimburseForm = true; // Tampilkan formulir reimburse
      _showListView = false; // Sembunyikan ListView
    });
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _navigateToReimburseForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReimbursePage()), // Ganti dengan halaman formulir reimburse
    );
  }
}
