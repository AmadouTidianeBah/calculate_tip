import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal.shade400
          )
        )
      ),
    );
  }
}
