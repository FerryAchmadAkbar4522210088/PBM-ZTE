import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KesanPesanPage extends StatefulWidget {
  @override
  _KesanPesanPageState createState() => _KesanPesanPageState();
}

class _KesanPesanPageState extends State<KesanPesanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _pesanController = TextEditingController();

  List<Map<String, String>> _listPesan = [];

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pop(context);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        var url = Uri.parse('http://192.168.242.1/Belajar_Flutter/PBM-ZTE_github/database/kesanpesan.php');
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'nama': _namaController.text,
            'alamat': _alamatController.text,
            'kesanpesan': _pesanController.text,
          }),
        );

        print('Response body: ${response.body}');

        var result = json.decode(response.body);
  
        if (result['success']) {
          setState(() {
            
            _namaController.clear();
            _alamatController.clear();
            _pesanController.clear();
            _listPesan.clear();
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data berhasil dikirim!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal kirim data: ${result['message']}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Kesan & Pesan", style: TextStyle(color: Color(0xFFBFA181))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFBFA181)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/up.png", fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(_namaController, "Nama"),
                        _buildTextField(_alamatController, "Alamat"),
                        _buildTextField(_pesanController, "Kesan & Pesan", maxLines: 4),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF178582),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          ),
                          child: const Text("Kirim", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ..._listPesan.map((item) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      border: Border.all(color: Color(0xFFBFA181)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama: ${item['nama']}", style: TextStyle(color: Color(0xFFBFA181))),
                        Text("Alamat: ${item['alamat']}", style: TextStyle(color: Color(0xFFBFA181))),
                        const SizedBox(height: 5),
                        Text("Pesan: ${item['pesan']}", style: TextStyle(color: Color(0xFFBFA181))),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF0A1828).withOpacity(0.8),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xFFBFA181),
            unselectedItemColor: const Color(0xFF178582),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: "Pesan"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Color(0xFFBFA181)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFFBFA181)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFBFA181)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF178582)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mohon isi $label';
          }
          return null;
        },
      ),
    );
  }
}
