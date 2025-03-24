import 'package:flutter/material.dart';

class ChrisPage extends StatefulWidget {
  @override
  _ChrisPageState createState() => _ChrisPageState();
}

class _ChrisPageState extends State<ChrisPage> {
  int _selectedIndex = 1; // Atur indeks default ke halaman saat ini

  void _onItemTapped(int index) {
    if (index == 0) {
      // Jika Home diklik, kembali ke HomePage
      Navigator.pop(context);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chris")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Nama Lengkap: Christian Jonathan Kolinug"),
            Text("Nama Panggilan: Christian Jonathan Kolinug"),
            Text("NPM: 4522210105"),
            Text("Jenis Kelamin: Laki - laki"),
            Text("Nomor Telepon: 082125062257"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30, left: 25, right: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
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
}
