import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChrisPage extends StatefulWidget {
  final String namaPanggilan; 

  ChrisPage({required this.namaPanggilan});

  @override
  _ChrisPageState createState() => _ChrisPageState();
}

class _ChrisPageState extends State<ChrisPage> {
  int _selectedIndex = 1;

  
  String namaLengkap = '';
  String namaPanggilan = '';
  String npm = '';
  String jenisKelamin = '';
  String nomorTelepon = '';
  String fotoUrl = '';

  
  bool isLoading = true;
  bool isError = false;

  
  final String apiUrl = "http://192.168.242.1/Belajar_Flutter/PBM-ZTE_github/database/profile.php";

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  
  Future<void> fetchProfileData() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?nama_panggilan=${widget.namaPanggilan}')); 

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["success"]) {
          final profile = data["data"][0];

          setState(() {
            namaLengkap = profile["nama_lengkap"] ?? '';
            namaPanggilan = profile["nama_panggilan"] ?? '';
            npm = profile["npm"] ?? '';
            jenisKelamin = profile["jenis_kelamin"] ?? '';
            nomorTelepon = profile["nomor_telepon"] ?? '';
            fotoUrl = profile["foto"] ?? '';  
            isLoading = false;
          });
        } else {
          setState(() {
            isError = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pop(context);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Profil ${widget.namaPanggilan}", style: TextStyle(color: Color(0xFFBFA181))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFBFA181)),
      ),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              "assets/up.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),

          // Isi konten
          Positioned.fill(
            child: isLoading
                ? Center(child: CircularProgressIndicator(color: Color(0xFFBFA181)))
                : isError
                    ? Center(
                        child: Text(
                          "Gagal memuat data.",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFF0A1828), width: 4),
                              ),
                              child: ClipOval(
                                child: fotoUrl.isNotEmpty
                                    ? Image.network(
                                        fotoUrl,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child; // Gambar sudah selesai
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: Color(0xFFBFA181),
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                      (loadingProgress.expectedTotalBytes ?? 1)
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/chriss.jpeg',  
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/chriss.jpeg',  
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                color: Color(0xFF0A1828).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildProfileItem("Nama Lengkap", namaLengkap),
                                  buildProfileItem("Nama Panggilan", namaPanggilan),
                                  buildProfileItem("NPM", npm),
                                  buildProfileItem("Jenis Kelamin", jenisKelamin),
                                  buildProfileItem("Nomor Telepon", nomorTelepon),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF0A1828).withOpacity(0.8),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Color(0xFFBFA181),
            unselectedItemColor: Color(0xFF178582),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan 1 data profil
  Widget buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        "$title: $value",
        style: TextStyle(color: Color(0xFFBFA181)),
      ),
    );
  }
}
