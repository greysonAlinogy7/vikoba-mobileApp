import 'package:flutter/material.dart';

class AppForm {
  Widget buildAppForm() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true, // ✅ allows background color
        fillColor: Colors.black, // ✅ sets background color
        hintText: "Enter text",
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      style: const TextStyle(color: Colors.white), // ✅ text color
    );
  }
}
