import 'package:flutter/material.dart';

class FarellPage extends StatefulWidget {
  @override
  _FarellPageState createState() => _FarellPageState();
}

class _FarellPageState extends State<FarellPage> {
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
      appBar: AppBar(title: const Text("Farell")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Nama Lengkap: Farell Rakha Rabbani Arian"),
            Text("Nama Panggilan: Farell"),
            Text("NPM: 4522210096"),
            Text("Jenis Kelamin: Laki - laki"),
            Text("Nomor Telepon: 08999223611"),
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
