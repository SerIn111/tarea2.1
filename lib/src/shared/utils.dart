import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Utils{
  static showSnackBar({
    required BuildContext context,
    required String title,
    Color? color,
    required Duration duracion
  }) {
    ScaffoldMessenger.of(
      context
    ).showSnackBar(
      SnackBar(
      content: Text(
        title, 
        style: const TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold),
        ), backgroundColor: color,
        duration: duracion
      ),
    );
  }

  static showConfirm({
    required BuildContext context,
    void Function()? confirmButton,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Comfirmación'),
          content: const Text('Desea realizar esta acción?'),
          actions: [
            TextButton(
              onPressed: confirmButton,
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}