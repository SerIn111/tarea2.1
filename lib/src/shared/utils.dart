import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Utils{
  static showSnackBar({
    required BuildContext context,
    required String title,
    Color? color,
  }) {
    ScaffoldMessenger.of(
      context
    ).showSnackBar(SnackBar(content: Text(
      title, 
      style: const TextStyle(
        fontSize: 18, 
        fontWeight: FontWeight.bold),
      ), backgroundColor: color)
    );
  }
}