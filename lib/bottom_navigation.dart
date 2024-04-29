import 'package:flutter/material.dart';
import 'pages/absen.dart';
import 'pages/tabs_gaji_reimburse.dart';
import 'pages/home.dart';
import 'pages/tabs_izin_cuti.dart';
import 'pages/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AbsenPage(),
    GajiReimburse(),
    IzinCutiTabs(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(Icons.home, 'Beranda', 0),
          _buildBottomNavigationBarItem(Icons.access_time, 'Absensi', 1),
          _buildBottomNavigationBarItem(Icons.wallet, 'Gaji', 2),
          _buildBottomNavigationBarItem(Icons.description, 'Izin Cuti', 3),
          _buildBottomNavigationBarItem(Icons.account_circle, 'Akun', 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon),
        ],
      ),
      label: label,
      backgroundColor: Colors.white,
    );
  }
}
