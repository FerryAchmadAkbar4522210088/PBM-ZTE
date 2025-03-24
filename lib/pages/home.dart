import 'package:flutter/material.dart';
import 'package:pbm/pages/bayu.dart';
import 'package:pbm/pages/chris.dart';
import 'package:pbm/pages/farell.dart';
import 'package:pbm/pages/ferry.dart';
import 'package:pbm/pages/hafidz.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),  // Home
    SearchPage(),   // Search
    ProfilePage(),  // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: const Text("ZTE")),
      body: _pages[_selectedIndex],

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
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// Halaman Search (dummy)
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Search Page"));
  }
}

// Halaman Profile (dummy)
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page"));
  }
}
