import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

class EditReimburse extends StatefulWidget {
  final bool showIzin;
  const EditReimburse({Key? key, this.showIzin = false}) : super(key: key);

  @override
  _EditReimburseState createState() => _EditReimburseState();
}

class _EditReimburseState extends State<EditReimburse> {  
  File? _image;
  String? _selectedJenisReimburse; // Change to nullable type
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _alasanController = TextEditingController(); // Added alasan controller

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
        title: const Text('Edit Reimburse'),
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
                      labelText: 'Pilih Jenis Reimburse',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.article),
                    ),
                    value: _selectedJenisReimburse,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedJenisReimburse = newValue!;
                      });
                    },
                    items: <String>[
                      'Pilih Jenis Reimburse',
                      'Uang Makan',
                      'Uang Transport',
                      'Uang Meeting'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _nominalController,
                    decoration: InputDecoration(
                      labelText: 'Nominal',
                      hintText: 'Masukkan Nominal',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.monetization_on),
                      prefixText: 'Rp ',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField( // Added TextFormField for alasan
                    controller: _alasanController,
                    decoration: InputDecoration(
                      labelText: 'Alasan',
                      hintText: 'Masukkan Alasan',
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
