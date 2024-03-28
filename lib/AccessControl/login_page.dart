import 'package:AlanAbsen/AccessControl/forgot_password.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import '../pages/home.dart'; // Import home.dart file
import '../bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isPasswordVisible = false;

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
                children: <Widget>[
                  const SizedBox(height: 30),
                  Image.asset(
                    'images/login.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Masuk Untuk Melakukan Absensi',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Email',
                      labelText: 'Email',
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
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kata sandi',
                      labelText: 'Kata sandi',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 170, 255)),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: rememberMe ? Colors.red : null,
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      // Navigate to MyHomePage when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavigation()),
                      );
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Install',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordForm()),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent;
                        }
                        return null; // Defer to the widget's default.
                      }),
                    ),
                    child: const Text(
                      'Lupa Kata Sandi?',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
