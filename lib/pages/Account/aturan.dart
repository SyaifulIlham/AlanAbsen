import 'package:flutter/material.dart';

void main() {
  runApp(const RulesPage());
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aturan'),
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
              RuleSection(
                title: 'A. Definisi',
                content: [
                  '1. PT Tokopedia adalah suatu perseroan terbatas yang menjalankan kegiatan usaha jasa web portal www.tokopedia.com, yakni situs pencarian toko dan Barang yang dijual oleh penjual terdaftar. Selanjutnya disebut Tokopedia.',
                  '2. Situs Tokopedia adalah www.tokopedia.com.',
                  '3. Syarat & ketentuan adalah perjanjian antara Pengguna dan Tokopedia yang berisikan seperangkat peraturan yang mengatur hak, kewajiban, tanggung jawab pengguna dan Tokopedia, serta tata cara penggunaan sistem layanan Tokopedia.',
                  '4. Pengguna adalah pihak yang menggunakan layanan Tokopedia, termasuk namun tidak terbatas pada pembeli, penjual maupun pihak lain yang sekedar berkunjung ke Situs Tokopedia.',
                  '5. Pembeli adalah Pengguna terdaftar yang melakukan permintaan atas Barang yang dijual oleh Penjual di Situs Tokopedia.',
                  '6. Penjual adalah Pengguna terdaftar yang melakukan tindakan buka toko dan/atau melakukan penawaran atas suatu Barang kepada para Pengguna Situs Tokopedia.',
                  '7. Barang adalah benda yang berwujud / memiliki fisik Barang yang dapat diantar / memenuhi kriteria pengiriman oleh perusahaan jasa pengiriman Barang.'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RuleSection extends StatelessWidget {
  final String title;
  final List<String> content;

  const RuleSection({
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content
              .map((paragraph) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      paragraph,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
