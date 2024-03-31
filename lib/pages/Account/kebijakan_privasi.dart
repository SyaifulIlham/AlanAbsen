import 'package:flutter/material.dart';

void main() {
  runApp(const PrivacyPolicyPage());
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kebijakan Privasi'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrivacyPolicySection(
                title:
                    'Kebijakan Privasi ini (beserta syarat-syarat penggunaan dari situs Tokopedia sebagaimana tercantum dalam Syarat & Ketentuan dan informasi lain yang tercantum di Situs) menetapkan dasar atas perolehan, pengumpulan, pengolahan, penganalisisan, penampilan, pengiriman, pembukaan, penyimpanan, perubahan, penghapusan dan/atau segala bentuk pengelolaan yang terkait dengan data atau informasi yang mengidentifikasikan atau dapat digunakan untuk mengidentifikasi Pengguna yang Pengguna berikan kepada Tokopedia atau yang Tokopedia kumpulkan dari Pengguna maupun pihak ketiga (selanjutnya disebut sebagai "Data Pribadi").', content: '',
              ),
              PrivacyPolicySection(
                title:
                    'Dengan mengklik “Daftar” (Register) atau pernyataan serupa yang tersedia di laman pendaftaran Situs, Pengguna menyatakan bahwa setiap Data Pribadi Pengguna merupakan data yang benar dan sah, Pengguna mengakui bahwa ia telah diberitahukan dan memahami ketentuan Kebijakan Privasi ini serta Pengguna memberikan persetujuan kepada Tokopedia untuk memperoleh, mengumpulkan, mengolah, menganalisis, menampilkan, mengirimkan, membuka, menyimpan, mengubah, menghapus, mengelola dan/atau mempergunakan data tersebut untuk tujuan sebagaimana tercantum dalam Kebijakan Privasi.', content: '',
              ),
              PrivacyPolicySection(
                title: 'Perolehan dan Pengumpulan Data Pribadi Pengguna',
                content:
                    'Perolehan dan Pengumpulan Data Pribadi Pengguna dilakukan sesuai dengan ketentuan yang tercantum dalam Kebijakan Privasi ini. Data Pribadi Pengguna dapat diperoleh dan dikumpulkan melalui berbagai cara, termasuk namun tidak terbatas pada pengisian formulir, penggunaan fitur-fitur di Situs, dan interaksi Pengguna dengan Tokopedia melalui layanan-layanan komunikasi yang disediakan oleh Tokopedia.',
              ),
              PrivacyPolicySection(
                title: 'Penggunaan Data Pribadi',
                content:
                    'Data Pribadi Pengguna dapat digunakan oleh Tokopedia untuk berbagai tujuan yang terkait dengan pengoperasian dan pengembangan Situs, pelayanan kepada Pengguna, pengembangan produk dan layanan baru, analisis penggunaan Situs, peningkatan keamanan dan fungsionalitas Situs, serta keperluan-keperluan lain yang sah menurut hukum.',
              ),
              PrivacyPolicySection(
                title: 'Pengungkapan Data Pribadi Pengguna',
                content:
                    'Tokopedia dapat mengungkapkan Data Pribadi Pengguna kepada pihak ketiga dalam situasi-situasi yang diperlukan sesuai dengan hukum, peraturan, atau permintaan resmi dari lembaga berwenang, atau untuk melindungi hak, keamanan, atau properti Tokopedia.',
              ),
              PrivacyPolicySection(
                title: 'Cookies',
                content:
                    'Situs Tokopedia dapat menggunakan cookies dan teknologi serupa lainnya untuk mengumpulkan informasi tentang penggunaan Situs oleh Pengguna. Cookies dapat digunakan untuk menyimpan preferensi Pengguna, mengidentifikasi Pengguna saat mereka masuk ke Situs, dan menyediakan layanan yang disesuaikan dengan kebutuhan Pengguna.',
              ),
              PrivacyPolicySection(
                title: 'Pilihan Pengguna dan Transparansi',
                content:
                    'Pengguna memiliki hak untuk mengontrol pengumpulan, penggunaan, dan pengungkapan Data Pribadi mereka. Tokopedia memberikan akses dan pilihan kepada Pengguna untuk mengelola preferensi privasi mereka, termasuk pengaturan cookies dan preferensi komunikasi.',
              ),
              PrivacyPolicySection(
                title: 'Keamanan, Penyimpanan, dan Penghapusan Data Pribadi Pengguna',
                content:
                    'Tokopedia berkomitmen untuk menjaga keamanan Data Pribadi Pengguna dengan menerapkan langkah-langkah keamanan yang sesuai. Data Pribadi Pengguna akan disimpan selama diperlukan untuk tujuan yang dijelaskan dalam Kebijakan Privasi ini, dan akan dihapus ketika tidak lagi diperlukan atau jika Pengguna meminta penghapusan.',
              ),
              PrivacyPolicySection(
                title: 'Akses dan Perbaikan Data Pribadi Pengguna atau Penarikan Kembali Persetujuan',
                content:
                    'Pengguna memiliki hak untuk mengakses, memperbarui, atau mengoreksi Data Pribadi mereka yang disimpan oleh Tokopedia. Pengguna juga dapat menarik kembali persetujuan mereka untuk penggunaan atau pengungkapan Data Pribadi mereka dengan menghubungi Tokopedia.',
              ),
              PrivacyPolicySection(
                title: 'Pengaduan terkait Perlindungan Data Pribadi Pengguna',
                content:
                    'Tokopedia menyediakan saluran pengaduan untuk Pengguna yang memiliki keluhan atau pertanyaan terkait perlindungan data pribadi mereka. Pengguna dapat menghubungi Tokopedia melalui informasi yang tersedia di Situs.',
              ),
              PrivacyPolicySection(
                title: 'Hubungi Kami',
                content:
                    'Jika Pengguna memiliki pertanyaan tambahan tentang Kebijakan Privasi ini atau ingin menghubungi Tokopedia untuk tujuan lain, Pengguna dapat menggunakan informasi kontak yang tersedia di Situs.',
              ),
              PrivacyPolicySection(
                title: 'Penyimpanan, Permohonan Subjek Data, dan Penghapusan Informasi',
                content:
                    'Tokopedia akan menyimpan Data Pribadi Pengguna sesuai dengan ketentuan hukum yang berlaku. Pengguna dapat mengajukan permohonan terkait data pribadi mereka kepada Tokopedia dan meminta penghapusan informasi mereka jika diizinkan oleh hukum yang berlaku.',
              ),
              PrivacyPolicySection(
                title: 'Pembaruan Kebijakan Privasi',
                content:
                    'Tokopedia dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu sesuai dengan perubahan hukum atau kebutuhan bisnis. Perubahan signifikan dalam Kebijakan Privasi akan diberitahukan kepada Pengguna melalui Situs atau melalui metode komunikasi lain yang sesuai.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicySection({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
