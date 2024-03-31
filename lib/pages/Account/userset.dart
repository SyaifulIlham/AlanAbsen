import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _selectedUnitKerja = 'WEB Developer';
  String _selectedJenisKelamin = 'Laki-laki';

  ImageProvider<Object>? _profileImage;
  
  get _ambilGambar => null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _ambilGambar,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _profileImage,
                  ),
                  InkWell(
                    onTap: _ambilGambar,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nama', // Label for Name
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email', // Label for Email
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon', // Label for Phone Number
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Unit Kerja', // Label for Work Unit
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
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
    ), backgroundColor: Colors.blue, // Ubah warna latar belakang
    minimumSize: const Size(double.infinity, 50), // Ubah lebar tombol
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
    );
  }
}
