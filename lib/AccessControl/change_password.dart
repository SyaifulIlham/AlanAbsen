import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ChangePassword({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 5.0),
                      Text(
                        'Ubah Kata Sandi',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold, // Set bold here
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 80.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan kata sandi baru',
                      labelText: 'Kata sandi baru',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 170, 255)),
                      ),
                      prefixIcon: Icon(Icons.lock), // Menggunakan ikon kunci
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Konfirmasi kata sandi',
                      labelText: 'Konfirmasi kata sandi',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 170, 255)),
                      ),
                      prefixIcon: Icon(Icons.lock), // Menggunakan ikon kunci
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Ganti Kata Sandi',
                      style: TextStyle(color: Colors.white),
                    ),
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
