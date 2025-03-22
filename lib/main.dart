import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 187, 22),
        centerTitle: true,
        title: const Text(
          "ZTE",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 65, 46),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 246, 169, 54), Color.fromARGB(255, 235, 0, 0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: NameList(),
        ),
      ),
    );
  }
}

class NameList extends StatelessWidget {
  const NameList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          NameBox(name: "Hafidz", angle: pi / 12, radius: 10),
          NameBox(name: "Ferry", angle: -pi / 12, radius: 20),
          NameBox(name: "Bayu", angle: pi / 8, radius: 30),
          NameBox(name: "Chris", angle: -pi / 8, radius: 40),
          NameBox(name: "Farrel", angle: pi / 6, radius: 50),
        ],
      ),
    );
  }
}

class NameBox extends StatelessWidget {
  final String name;
  final double angle;
  final double radius;

  const NameBox({super.key, required this.name, required this.angle, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 46, 139, 136),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E8B57),
          ),
        ),
      ),
    );
  }
}
