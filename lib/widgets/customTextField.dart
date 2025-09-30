import 'package:flutter/material.dart';

Widget CustomTextField({
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      color: Colors.white.withOpacity(0.4),
      child: TextField(
        controller: controller,
        style: TextStyle(color: const Color.fromARGB(255, 122, 121, 121)),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1.5),
          ),
          filled: true,
          // fillColor: const Color.fromARGB(255, 229, 228, 228),
          fillColor: Colors.white.withOpacity(0.4),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14, color: const Color.fromARGB(255, 122, 121, 121)),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}
