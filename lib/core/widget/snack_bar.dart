import 'package:flutter/material.dart';

class SnackBarMessage {
  void show(BuildContext context, {required String message, Color? color}) {
    // Implement your snack bar logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
