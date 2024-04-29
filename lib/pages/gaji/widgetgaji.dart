import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:AlanAbsen/pages/gaji/popup_gaji.dart';

class GajiPage extends StatefulWidget {
  @override
  _GajiPageState createState() => _GajiPageState();
}

class _GajiPageState extends State<GajiPage> {
  String _status = 'Belum lunas'; // Status default
  String _selectedDate = ''; // Tanggal yang dipilih

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                // Dropdown untuk memilih status
                child: DropdownButton<String>(
                  value: _status,
                  items: <String>['Lunas', 'Belum lunas'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _status = newValue ?? 'Belum lunas';
                    });
                  },
                  isExpanded: true,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Pilih Tanggal',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  controller: TextEditingController(text: _selectedDate),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          _buildLeaveInfoCard(
            status: _status,
            name: 'Syaiful',
            number: 'Rp. 125.000',
            type: 'nama pegawai',
            context: context,
          ),
        ],
      ),
    );
  }
}

// Fungsi untuk membangun kartu informasi izin
Widget _buildLeaveInfoCard({
  required String status,
  required String name,
  required String number,
  required String type,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      showDetailPopup(status, name, number, type, context);
    },
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 80, 79, 75),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Gaji',
              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              number,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    ),
  );
}
