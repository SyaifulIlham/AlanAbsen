import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // Import PDF viewer package
import 'package:flutter_signature_pad/flutter_signature_pad.dart'; // Import signature pad package

void main() {
  runApp(const PerjanjianKerja());
}

class PerjanjianKerja extends StatelessWidget {
  const PerjanjianKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perjanjian Kerja'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // PDF viewer
            Expanded(
              child: SfPdfViewer.asset(
                'assets/PR605929865436(1).pdf', // Path to your PDF file
              ),
            ),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Show modal popup for signature
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const SignaturePadModal();
                      },
                    );
                  },
                  child: const Text('Buat Tanda Tangan'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to submit form
                  },
                  child: const Text('Ajukan Surat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignaturePadModal extends StatefulWidget {
  const SignaturePadModal({super.key});

  @override
  _SignaturePadModalState createState() => _SignaturePadModalState();
}

class _SignaturePadModalState extends State<SignaturePadModal> {
  late SignatureController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignatureController(
      penColor: Colors.black,
      strokeWidth: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Signature pad
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Signature(
              color: Colors.black,
            ),
          ),
        // Undo button
ElevatedButton(
  onPressed: () {
    setState(() {
      // Call the clear method directly on the Signature widget
      // to clear the signature
      _controller.clear();
    });
  },
  child: const Text('Undo'),
),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to capture signature
                  // Access the signature data: _controller.toPngBytes()
                  Navigator.of(context).pop();
                },
                child: const Text('Oke'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SignatureController {
  SignatureController({
    required this.penColor,
    required this.strokeWidth,
  });

  final Color penColor;
  final double strokeWidth;

  void clear() {}
}
