import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registrarse'),
        ),
        body: const Center(
          child: Text('Registrarse'),
        ),
      ),
    );
  }
}