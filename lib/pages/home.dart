import 'package:flutter/material.dart';
import 'package:pbm/pages/bayu.dart';
import 'package:pbm/pages/chris.dart';
import 'package:pbm/pages/farell.dart';
import 'package:pbm/pages/ferry.dart';
import 'package:pbm/pages/hafidz.dart';
import 'package:pbm/pages/kesanpesan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    KesanPesanPage(),
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
      extendBody: true,
      appBar: AppBar(
        title: const Text("ZTE", style: TextStyle(color: Color(0xFFBFA181))),
        backgroundColor: Color(0xFF0A1828),
        iconTheme: IconThemeData(color: Color(0xFF178582)),
        elevation: 0,
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
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF0A1828).withOpacity(0.9),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Color(0xFFBFA181),
            unselectedItemColor: Color(0xFF178582),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Kesan & Pesan"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 180),
          _buildButton(context, "Hafidz", HafidzPage()),
          _buildButton(context, "Ferry", FerryPage()),
          _buildButton(context, "Bayu", BayuPage()),
          _buildButton(context, "Farell", FarellPage()),
          _buildButton(context, "Chris", ChrisPage()),
          _buildButton(context, "Kesan & Pesan", KesanPesanPage()),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String name, Widget page) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => page));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color(0xFFBFA181)),
              ),
            ),
            child: Text(
              name,
              style: TextStyle(color: Color(0xFFBFA181), fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page", style: TextStyle(color: Color(0xFFBFA181))));
  }
}
