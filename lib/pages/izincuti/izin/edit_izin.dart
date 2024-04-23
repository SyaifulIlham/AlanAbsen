import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart'; // Import DateFormat from intl package

class EditIzinPage extends StatefulWidget {
  final bool showIzin;
  const EditIzinPage({Key? key, this.showIzin = false}) : super(key: key);

  @override
  _EditIzinPageState createState() => _EditIzinPageState();
}

class _EditIzinPageState extends State<EditIzinPage> {
  File? _image;
  String? _selectedJenisIzin; // Change to nullable type
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

  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showImagePreviewDialog(String imagePath) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Preview Gambar'),
          content: Image.network(imagePath),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey,
        style: BorderStyle.solid,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Izin'),
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Pilih Jenis Izin',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.article),
                    ),
                    value: _selectedJenisIzin,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedJenisIzin = newValue!;
                      });
                    },
                    items: <String>['Pilih Jenis Izin', 'WFH', 'Sakit', 'Izin Lainnya'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _tanggalController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Izin',
                      hintText: 'Masukkan Tanggal Izin',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () async {
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
                      hintText: 'Masukkan Alasan Izin',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.text_snippet),
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20.0),
                  _image == null
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              getImage(ImageSource.camera);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: _containerDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                  ),
                                  Text(
                                    'Tap to take a picture',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (kIsWeb) {
                              _showImagePreviewDialog(_image!.path);
                            } else {
                              _showImagePreviewDialog(_image! as String);
                            }
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: kIsWeb
                                ? Image.network(
                                    _image!.path,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  )
                                : Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                          ),
                        ),
                  const SizedBox(height: 20.0),
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
