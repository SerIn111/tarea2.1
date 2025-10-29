import 'package:flutter/material.dart';
import 'package:tarea2_1/src/widgets/mytextfield.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          title: const Center(child: Text('Inicio de sesion', style: TextStyle(fontSize: 30),)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[100]
                ),
                child: Column(
                  children: [
                    const Text('Ingrese su correo', style: TextStyle(fontSize: 20),),
                    MyTextfield(
                    type: TextInputType.emailAddress,
                    textoejemplo: 'ejemplo@unah.hn',
                    ),
                  ],
                ),

              ),
              const Text('Ingrese su contraseña', style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextfield(
                  type: TextInputType.number,
                  obscuretext: true,
                  icono: Icon(Icons.remove_red_eye_rounded),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: TextButton(
          child: const Text('Registrarse', style: TextStyle(color: Colors.blue),),
          onPressed: () {},
        )
      ),
    );
  }
}