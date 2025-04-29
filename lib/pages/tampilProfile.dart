import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TampilProfile extends StatefulWidget {
  final String namaPanggilan;

  TampilProfile({required this.namaPanggilan});

  @override
  _TampilProfileState createState() => _TampilProfileState();
}

class _TampilProfileState extends State<TampilProfile> {
  Map<String, dynamic>? profileData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.242.1/Belajar_Flutter/PBM-ZTE_github/database/profile.php'),
        body: {
          'nama_panggilan': widget.namaPanggilan,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          profileData = data;
          isLoading = false;
        });
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          profileData != null ? "Profil ${profileData!['nama_panggilan']}" : "Loading...",
          style: const TextStyle(color: Color(0xFFBFA181)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFBFA181)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/up.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),
          Positioned.fill(
            child: isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFFBFA181)))
                : profileData == null
                    ? const Center(child: Text('Gagal memuat data', style: TextStyle(color: Colors.white)))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xFF0A1828), width: 4),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'http://192.168.242.1/Belajar_Flutter/PBM-ZTE_github/database/foto/${profileData!['foto']}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error, color: Colors.red);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0A1828).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama Lengkap: ${profileData!['nama_lengkap']}", style: const TextStyle(color: Color(0xFFBFA181))),
                                Text("Nama Panggilan: ${profileData!['nama_panggilan']}", style: const TextStyle(color: Color(0xFFBFA181))),
                                Text("NPM: ${profileData!['npm']}", style: const TextStyle(color: Color(0xFFBFA181))),
                                Text("Jenis Kelamin: ${profileData!['jenis_kelamin']}", style: const TextStyle(color: Color(0xFFBFA181))),
                                Text("Nomor Telepon: ${profileData!['nomor_telepon']}", style: const TextStyle(color: Color(0xFFBFA181))),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
