import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CutiPage extends StatefulWidget {
  final bool showIzin;
  const CutiPage({Key? key, this.showIzin = false}) : super(key: key);

  @override
  _CutiPageState createState() => _CutiPageState();
}

class _CutiPageState extends State<CutiPage> {
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _alasanController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _tanggalController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Cuti'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _tanggalController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Izin',
                      hintText: 'Masukkan Tanggal Izin',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _alasanController,
                    decoration: InputDecoration(
                      labelText: 'Alasan',
                      hintText: 'Masukkan Alasan Izin',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.text_snippet),
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 300.0),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to submit the form
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text('Kirim'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
