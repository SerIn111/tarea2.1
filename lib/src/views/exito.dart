import 'package:flutter/material.dart';

class Exito extends StatelessWidget {
  const Exito({super.key, required this.nombre});

  final String nombre;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $nombre'),
      ),
      body: Center(
        child: Text('Perfil de $nombre'),
      ),
    );
  }
}