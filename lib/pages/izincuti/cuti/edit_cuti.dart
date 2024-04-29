import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

class EditCutiPage extends StatefulWidget {
  final bool showIzin;
  const EditCutiPage({Key? key, this.showIzin = false}) : super(key: key);

  @override
  _EditCutiPageState createState() => _EditCutiPageState();
}

class _EditCutiPageState extends State<EditCutiPage> {
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _alasanController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );

    if (pickedDateRange != null) {
      setState(() {
        _startDate = pickedDateRange.start;
        _endDate = pickedDateRange.end;
      });

      if (_startDate != null && _endDate != null) {
        final formattedStartDate =
            DateFormat('yyyy-MM-dd').format(_startDate!);
        final formattedEndDate = DateFormat('yyyy-MM-dd').format(_endDate!);
        _tanggalController.text = '$formattedStartDate - $formattedEndDate';
      } else if (_startDate != null) {
        final formattedStartDate =
            DateFormat('yyyy-MM-dd').format(_startDate!);
        _tanggalController.text = formattedStartDate;
      } else {
        _tanggalController.text = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Cuti'),
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
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Cuti',
                      hintText: 'Pilih rentang tanggal cuti',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDateRange(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _alasanController,
                    decoration: InputDecoration(
                      labelText: 'Alasan',
                      hintText: 'Masukkan Alasan Cuti',
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

