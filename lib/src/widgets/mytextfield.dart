import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextfield extends StatelessWidget{
  MyTextfield({super.key, required this.type, this.obscuretext = false, this.textoejemplo = '', this.icono});

  final TextInputType type;
  final bool obscuretext;
  final String textoejemplo;
  final Widget? icono;
  @override
  Widget build(BuildContext context){
    return TextField(
      keyboardType: type,
      obscureText: obscuretext,
      decoration: InputDecoration(
        label: Text(textoejemplo),
        suffixIcon: icono
      ),
      
    );
  }
}