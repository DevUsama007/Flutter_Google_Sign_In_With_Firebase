import 'package:flutter/material.dart';

class ShowNotification {
 static customNotifcation(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            message,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          )),
    );
  }
}
