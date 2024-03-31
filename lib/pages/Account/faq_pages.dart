import 'package:flutter/material.dart';

void main() {
  runApp(const FAQPages());
}

class FAQPages extends StatelessWidget {
  const FAQPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FAQ'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FAQItem(
                question: 'Apa saja Jadwal untuk absen?',
                answer:
                    'Jadwal untuk absen dapat dilihat di sistem atau aplikasi absensi yang digunakan. Biasanya, jadwal ini sudah ditentukan oleh aturan perusahaan atau institusi terkait.',
              ),
              FAQItem(
                question: 'Kapan waktu untuk bisa absen?',
                answer:
                    'Waktu untuk melakukan absen biasanya telah ditentukan oleh aturan perusahaan atau institusi terkait. Biasanya, waktu absen ini disesuaikan dengan jam kerja atau kegiatan yang sedang berlangsung.',
              ),
              FAQItem(
                question: 'Apa Yang Terjadi jika tidak absen?',
                answer:
                    'Konsekuensi dari tidak melakukan absen dapat bervariasi tergantung pada kebijakan perusahaan atau institusi terkait. Namun, umumnya bisa berakibat pada potongan gaji, sanksi, atau tindakan lain sesuai dengan peraturan yang berlaku.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
    super.key,
  });

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onExpansionChanged: (isOpen) {
          setState(() {
            _isOpen = isOpen;
          });
        },
        initiallyExpanded: _isOpen,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.answer,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
