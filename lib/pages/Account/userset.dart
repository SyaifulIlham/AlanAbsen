import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _selectedUnitKerja = 'WEB Developer';
  String _selectedJenisKelamin = 'Laki-laki';

  ImageProvider<Object>? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final ByteData data = await rootBundle.load('assets/profile_picture.jpg');
    setState(() {
      _profileImage = MemoryImage(data.buffer.asUint8List());
    });
  }

  Future<void> _showImagePreviewDialog(File imageFile) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Pratinjau Gambar'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              // Use conditional expression to display image based on platform
              kIsWeb
                  ? Image.network(imageFile.path)
                  : Image.file(imageFile),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Oke'),
            onPressed: () {
              setState(() {
                _profileImage = (kIsWeb
                    ? NetworkImage(imageFile.path)
                    : FileImage(imageFile)) as ImageProvider<Object>?;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File imageFile = File(image.path);
      setState(() {
        _profileImage = FileImage(imageFile);
      });
      await _showImagePreviewDialog(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _getImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: _profileImage,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Nama', // Gender
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama', // Label for Name
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email', // Gender
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email', // Label for Email
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nomor Telepon', // Gender
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon', // Label for Phone Number
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Unit Kerja',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                value: _selectedUnitKerja,
                onChanged: (newValue) {
                  setState(() {
                    _selectedUnitKerja = newValue!;
                  });
                },
                items: <String>[
                  'WEB Developer',
                  'HRD',
                  'Business Developer',
                  'Graphic Design',
                  'Social Media Specialist',
                  'UI/UX Designer',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jenis Kelamin:', // Gender
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Laki-laki', // Male
                        groupValue: _selectedJenisKelamin,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedJenisKelamin = value!;
                          });
                        },
                      ),
                      const Text('Laki-laki'), // Male
                      const SizedBox(width: 20),
                      Radio<String>(
                        value: 'Perempuan', // Female
                        groupValue: _selectedJenisKelamin,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedJenisKelamin = value!;
                          });
                        },
                      ),
                      const Text('Perempuan'), // Female
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.blue, // Ubah warna latar belakang
                  minimumSize:
                      const Size(double.infinity, 50), // Ubah lebar tombol
                ),
                onPressed: () {
                  // Tambahkan logika untuk menyimpan perubahan profil
                },
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white), // Ubah warna teks
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
