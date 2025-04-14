import 'package:flutter/material.dart';

class HafidzPage extends StatefulWidget {
  @override
  _HafidzPageState createState() => _HafidzPageState();
}

class _HafidzPageState extends State<HafidzPage> {
  int _selectedIndex = 1;

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
        title: const Text("Profil Hafidz", style: TextStyle(color: Color(0xFFBFA181))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFBFA181)),
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
            child: Column(
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
                    child: Image.asset("assets/hafidz.jpeg", fit: BoxFit.cover),
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
                    children: const [
                      Text("Nama Lengkap: Muhammad Hafidz Aulia", style: TextStyle(color: Color(0xFFBFA181))),
                      Text("Nama Panggilan: Hafidz", style: TextStyle(color: Color(0xFFBFA181))),
                      Text("NPM: 4522210063", style: TextStyle(color: Color(0xFFBFA181))),
                      Text("Jenis Kelamin: Laki - laki", style: TextStyle(color: Color(0xFFBFA181))),
                      Text("Nomor Telepon: 087876006020", style: TextStyle(color: Color(0xFFBFA181))),
                    ],
                  ),
                ),
              ],
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
            backgroundColor: Color(0xFF0A1828).withOpacity(0.8), // Transparan agar menyatu dengan background
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
}
