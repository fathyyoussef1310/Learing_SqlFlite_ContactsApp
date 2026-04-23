import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    required this.color,
    this.maxLines = 1,
    this.controller,
    this.onChange,
  });

  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hint;
  final Color color;
  final int maxLines;
  final TextEditingController? controller;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: color) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: color) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}