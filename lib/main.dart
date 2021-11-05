import 'package:flutter/material.dart';
import 'package:hodomojo_assignment/screens/home_screen.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
