import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget{
  MyTextfield({
    super.key, 
    required this.type, 
    required this.obscuretext, 
    this.textoejemplo = '', 
    this.icono,
    this.controller});

  final TextInputType type;
  bool obscuretext;
  final String textoejemplo;
  final Widget? icono;
  final TextEditingController? controller;
          

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscuretext; 
  }
  
  @override
  Widget build(BuildContext context){
    return TextField(
      keyboardType: widget.type,
      obscureText: _isObscured,
      decoration: InputDecoration(
        label: Text(widget.textoejemplo),
        suffixIcon: widget.obscuretext
          ? IconButton(
             icon : Icon(
              _isObscured 
              ? Icons.remove_red_eye_rounded 
              : Icons.visibility_off_rounded
            ), 
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
          : widget.icono,
      ),
      controller: widget.controller,
    );
  }
}