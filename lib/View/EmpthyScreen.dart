import 'package:flutter/material.dart';

class Empthyscreen extends StatelessWidget {
  const Empthyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("There's Not any Users yet"),),
    );
  }
}
