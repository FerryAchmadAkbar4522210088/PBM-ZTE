import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bayu.dart';
import 'package:flutter_application_1/pages/chris.dart';
import 'package:flutter_application_1/pages/farell.dart';
import 'package:flutter_application_1/pages/ferry.dart';
import 'package:flutter_application_1/pages/hafidz.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;

final List<Widget> _pages = [
  HomeContent(),
  HomeContent(),
  HomeContent(),
];

void _onItemTapped(int index){
  setState((){
    _selectedIndex = index;
  });
}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: const Text("ZTE")),
    body: _pages[_selectedIndex],
   
  bottomNavigationBar: Container(
  margin: EdgeInsets.only(bottom: 30, left: 25, right: 25),
  width: 1,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
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
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  ),
  )
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

            const SizedBox(height: 180,),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HafidzPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text("Hafidz",
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                
              ),
            ),
            const SizedBox(height: 20),



            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FerryPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text("Ferry",
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),




            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BayuPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text("Bayu",
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),



            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FarellPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text("Farell",
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),




            SizedBox(
              width: 200,
              height: 50,
              
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChrisPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text("Chris",
                style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
          
        ),
      );
    
   
  }
}

