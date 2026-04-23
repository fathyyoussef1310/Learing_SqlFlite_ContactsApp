import 'package:flutter/material.dart';

class CustomFloatingactionbutton extends StatelessWidget {
  const CustomFloatingactionbutton({super.key, required this.onPress});
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
      child: FloatingActionButton(onPressed: onPress,
      backgroundColor: Colors.grey,
      child: Icon(Icons.add,color: Colors.amber,),
      ),
    );
  }
}
