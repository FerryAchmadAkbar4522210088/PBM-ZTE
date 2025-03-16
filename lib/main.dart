import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2E8B57),
          centerTitle: true,
          title: const Text(
            "ZTE",
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black38,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: 300, // Memperbesar width
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2E8B57), // Warna shadow
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    ["Hafidz", "Ferry", "Bayu", "Chris", "Farrel"].map((name) {
                      return Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E8B57),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
