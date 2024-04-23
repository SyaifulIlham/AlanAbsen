import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/gajireimburse/reimburse.dart'; // Ensure this path is correct

class GajiPage extends StatefulWidget {
  const GajiPage({super.key});

  @override
  _GajiPageState createState() => _GajiPageState();
}

class _GajiPageState extends State<GajiPage> {
  String _selectedStatus = 'status'; // Default status
  DateTime? _selectedDate;
  String _selectedExpenseType = 'Jenis'; // Default jenis pengeluaran
  bool _showReimburseForm = false; // State to track if the reimburse form is shown
  bool _showListView = true; // State to track if the ListView should be shown
  bool _showDropdown = false; // State to track if the dropdown should be shown
  bool _isGajiSelected = true; // State to track which button is selected
  bool _isReimburseSelected = false; // State to track which button is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Gaji & Reimburse',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Corrected
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: _handleGajiButtonClick,
                      child: Center(
                        child: Text(
                          'Gaji',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: _isGajiSelected ? Colors.blue : Colors.black,
                            decoration: _isGajiSelected
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey, // Divider antara Gaji dan Reimburse
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: _handleReimburseButtonClick,
                      child: Center(
                        child: Text(
                          'Reimburse',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: _isReimburseSelected ? Colors.blue : Colors.black,
                            decoration: _isReimburseSelected
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                      items: <String>['status', 'Lunas', 'Belum Lunas'].map((String value) {
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
                        if (_showDropdown)
                          Expanded(
                            child: DropdownButton<String>(
                              value: _selectedExpenseType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedExpenseType = newValue!;
                                });
                              },
                              items: <String>[
                                'Jenis',
                                'Uang Transport',
                                'Biaya Server',
                                'Lainnya'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () => _showDatePicker(context),
                                  child: Text(
                                    _selectedDate != null
                                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                      : 'Pilih Tanggal',
                                    style: const TextStyle(
                                      color: Colors.black,
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
              if (_showListView)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item Gaji $index'),
                    );
                  },
                ),
              const SizedBox(height: 400),
              if (_showReimburseForm)
                ElevatedButton(
                  onPressed: _navigateToReimburseForm,
                  child: const Text('Ajukan Reimburse'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleGajiButtonClick() {
    setState(() {
      _isGajiSelected = true; // Menunjukkan tombol yang dipilih
      _isReimburseSelected = false; // Menyembunyikan underline untuk tombol Reimburse
      _showReimburseForm = false;
      _showListView = true;
      _showDropdown = false; // Menyembunyikan dropdown saat kembali ke Gaji
    });
  }

  void _handleReimburseButtonClick() {
    setState(() {
      _isReimburseSelected = true; // Menunjukkan tombol yang dipilih
      _isGajiSelected = false; // Menyembunyikan underline untuk tombol Gaji
      _showReimburseForm = true;
      _showListView = false;
      _showDropdown = true; // Menampilkan dropdown saat klik Reimburse
    });
  }

  Future<void> _showDatePicker(BuildContext context) async {
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
      MaterialPageRoute(
        builder: (context) => const ReimbursePage(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GajiPage(),
  ));
}
