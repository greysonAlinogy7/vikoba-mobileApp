import 'package:flutter/material.dart';

class MyForm {

  Widget _buildForm() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(hintText: ""),
    );
  }
}
