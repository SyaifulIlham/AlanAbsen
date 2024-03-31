import 'package:AlanAbsen/pages/Account/aturan.dart';
import 'package:AlanAbsen/pages/Account/edit_password.dart';
import 'package:AlanAbsen/pages/Account/faq_pages.dart';
import 'package:AlanAbsen/pages/Account/kebijakan_privasi.dart';
import 'package:AlanAbsen/pages/Account/perjanjian_kerja.dart';
import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/Account/userset.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF00ACEE), // Ubah warna border di sini
              width: 2, // Ubah lebar border di sini
            ),
          ),
          child: const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Nama Anda',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Web Dev',
          style: TextStyle(fontSize: 18, color: Colors.blueAccent),
        ),
        const SizedBox(height: 10),
        const Text(
          'email@contoh.com',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Ubah Profil'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Ubah Kata Sandi'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Editpassword()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Perjanjian Kerja'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PerjanjianKerja()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('FAQ'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FAQPages()),
                  );
                },
              ),
                ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Aturan'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RulesPage()),
                  );
                },
              ),
                ListTile(
                leading: const Icon(Icons.info_rounded),
                title: const Text('Kebijakan Privasi'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
                  );
                },
              ),
              const SizedBox(height: 40), // Menambah jarak dari item FAQ ke tombol Keluar
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk keluar dari akun di sini
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.red, backgroundColor: Colors.white, shape: RoundedRectangleBorder( // Menggunakan RoundedRectangleBorder untuk menentukan bentuk tombol
              borderRadius: BorderRadius.circular(8), // Mengatur radius border
            ),
            side: const BorderSide(color: Colors.red, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20), // Melebarkan ukuran button
          ),
          child: const Text('Keluar'),
        ),
        const SizedBox(height: 140),
      ],
    );
  }
}
