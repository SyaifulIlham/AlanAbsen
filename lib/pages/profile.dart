import 'package:flutter/material.dart';
import 'package:AlanAbsen/pages/Account/aturan.dart';
import 'package:AlanAbsen/pages/Account/edit_password.dart';
import 'package:AlanAbsen/pages/Account/faq_pages.dart';
import 'package:AlanAbsen/pages/Account/kebijakan_privasi.dart';
import 'package:AlanAbsen/pages/Account/perjanjian_kerja.dart';
import 'package:AlanAbsen/pages/Account/userset.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

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
  const ProfileBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            child: CircleAvatar(
              radius: 40, // Decreased radius to make it smaller
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Nama Anda',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 0),
          const Text(
            'Web Developer',
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
          const SizedBox(height: 0),
          const Text(
            'email@contoh.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 5),
         ListView(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  children: [
    ListTile(
      leading: const Icon(Icons.person_add, size: 16),
      title: const Text(
        'Ubah Profil',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfilePage()),
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.lock, size: 16),
      title: const Text(
        'Ubah Kata Sandi',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Editpassword()),
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.edit, size: 16),
      title: const Text(
        'Perjanjian Kerja',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PerjanjianKerja()),
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.search, size: 16),
      title: const Text(
        'FAQ',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FAQPages()),
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.description, size: 16),
      title: const Text(
        'Aturan',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RulesPage()),
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.info_rounded, size: 16),
      title: const Text(
        'Kebijakan Privasi',
        style: TextStyle(fontSize: 14), // Set font size to 18px
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
        );
      },
    ),
    const SizedBox(height: 30), // Menambah jarak dari item FAQ ke tombol Keluar
  ],
),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk keluar dari akun di sini
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              ),
              child: const Text('Keluar'),
            ),
          ),
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}
