import 'package:flutter/material.dart';

Widget CustomButtonWidget(
    {required VoidCallback ontap, required String title}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      // width: 220,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
