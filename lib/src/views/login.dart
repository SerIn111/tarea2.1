import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2_1/data/users.dart';
import 'package:tarea2_1/src/shared/utils.dart';
import 'package:tarea2_1/src/widgets/mytextfield.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final correoController = TextEditingController();
  final contraseniaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Center(
          child: Text(
            'Inicio de sesion', style: TextStyle(fontSize: 30),
          )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextfield(
              obscuretext: false,
              type: TextInputType.emailAddress,
              textoejemplo: 'correo@unah.hn',
              controller: correoController,
              texto: 'Ingrese su correo',
              tamaniotexto: 20,
              pmargin: const EdgeInsets.all(10),
              ppadding: const EdgeInsets.all(20),
              radio: 20,
              color: Colors.black12,
            ),
            
            MyTextfield(
              obscuretext: true,
              type: TextInputType.visiblePassword,
              icono: IconButton(
                icon: const Icon(Icons.remove_red_eye_rounded),
                onPressed: (){
                }, 
              ),
              controller: contraseniaController,
              texto: 'Ingrese su contraseña',
              tamaniotexto: 20,
              pmargin: const EdgeInsets.all(10),
              ppadding: const EdgeInsets.all(20),
              radio: 20,
              color: Colors.black12,
            ),
            Center(
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue[350])
                ),
                onPressed: ()async{
                  if(usersdata.isEmpty)
                  {
                    Utils.showSnackBar(
                      context: context,
                      title: "No hay usuarios creados",
                      color: Colors.red[300],
                      duracion: const Duration(seconds: 2)
                    );
                  }
                  else
                  {
                    if(correoController.text.isEmpty || contraseniaController.text.isEmpty)
                    {
                      Utils.showSnackBar(
                        context: context,
                        title: "Ambos campos son obligatorios",
                        color: Colors.red[300],
                        duracion: const Duration(seconds: 2)
                      );
                    }
                    else
                    {
                      if(usersdata.any((user) => user['correo'] == correoController.text) && usersdata.any((user) => user['contrasenia'] == contraseniaController.text))
                      {
                        Utils.showSnackBar(
                          context: context,
                          title: "Inicio de sesion exitoso",
                          color: Colors.green[300],
                          duracion: const Duration(seconds: 2)
                        );

                        await Future.delayed(const Duration(seconds: 2), () {
                          context.goNamed('homepage');
                        });
                      }
                      else
                      {
                        Utils.showSnackBar(
                          context: context,
                          title: "Datos incorrectos",
                          color: Colors.red[300],
                          duracion: const Duration(seconds: 2)
                        );
                      }
                    }
                    print(usersdata);
                  }
                },
                child: const Text(
                  'Iniciar Sesion', 
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),              
      bottomSheet: TextButton(
        child: const Text(
          'Registrarse', 
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          context.goNamed('register');
        },
      )
    );
  }
}