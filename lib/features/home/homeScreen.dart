import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Welcome!", style: TextStyle(
        color: Colors.black, fontSize: 22
      ),)),
    );
  }
}
