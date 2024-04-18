import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

class ReimbursePage extends StatefulWidget {
  final bool showIzin;
  const ReimbursePage({super.key, this.showIzin = false});

  @override
  _ReimbursePageState createState() => _ReimbursePageState();
}

class _ReimbursePageState extends State<ReimbursePage> {
  File? _image;
  String _selectedJenisIzin = 'Uang Transport';
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _alasanController = TextEditingController();

  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _showImagePreviewDialog(String imagePath) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Preview Gambar'),
          content: Image.network(imagePath),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                setState(() {
                  _image = null;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
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
        title: const Text('Ajukan Reimburse'),
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
                    decoration: const InputDecoration(
                      labelText: 'Jenis Izin',
                      hintText: 'Pilih Jenis Izin',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.article),
                    ),
                    value: _selectedJenisIzin,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedJenisIzin = newValue!;
                      });
                    },
                    items: <String>['Uang Transport', 'Biaya Server', 'Lainnya'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Nominal (Rp)',
                      hintText: 'Masukkan Nominal (Rp)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.monetization_on),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _alasanController,
                    decoration: const InputDecoration(
                      labelText: 'keterangan',
                      hintText: 'Masukkan keterangan',
                      border: OutlineInputBorder(),
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
                              child: const Column(
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
