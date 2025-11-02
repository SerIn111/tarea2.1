import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2_1/data/users.dart';
import 'package:tarea2_1/src/shared/utils.dart';
import 'package:tarea2_1/src/widgets/mytextfield.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final registerNombreController = TextEditingController();
  final registerCorreoController = TextEditingController();
  final registerTelefonoController = TextEditingController();
  final registerContraseniaController = TextEditingController();
  final confirmContraseniaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nuevo Usuario')
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              MyTextfield(
                controller: registerNombreController,
                type: TextInputType.name, 
                obscuretext: false,
                texto: 'Escriba su nombre',
                tamaniotexto: 16,
                pmargin: const EdgeInsets.all(10),
                ppadding: const EdgeInsets.all(20),
                radio: 20,
                color: Colors.black12,
              ),

              MyTextfield(
                controller: registerCorreoController,
                type: TextInputType.emailAddress, 
                obscuretext: false,
                texto: 'Escriba el correo a usar',
                tamaniotexto: 16,
                pmargin: const EdgeInsets.all(10),
                ppadding: const EdgeInsets.all(20),
                radio: 20,
                color: Colors.black12,
              ),

              MyTextfield(
                controller: registerTelefonoController,
                type: TextInputType.number, 
                obscuretext: false,
                texto: 'Escriba su telefono',
                tamaniotexto: 16,
                pmargin: const EdgeInsets.all(10),
                ppadding: const EdgeInsets.all(20),
                radio: 20,
                color: Colors.black12,
              ),

              MyTextfield(
                controller: registerContraseniaController,
                type: TextInputType.visiblePassword, 
                obscuretext: true,
                texto: 'Escriba la contraseña',
                tamaniotexto: 16,
                pmargin: const EdgeInsets.all(10),
                ppadding: const EdgeInsets.all(20),
                radio: 20,
                color: Colors.black12,
              ),

              MyTextfield(
                controller: confirmContraseniaController,
                type: TextInputType.visiblePassword, 
                obscuretext: true,
                texto: 'Confirme la contraseña',
                tamaniotexto: 16,
                pmargin: const EdgeInsets.all(10),
                ppadding: const EdgeInsets.all(20),
                radio: 20,
                color: Colors.black12,
              ),

              const SizedBox(
                height: 120,
              ),
              FilledButton(
                child: const Text('Crear'),
                onPressed: () async{
                  int error = 0;
                  if(registerNombreController.text.isEmpty ||
                  registerCorreoController.text.isEmpty ||
                  registerTelefonoController.text.isEmpty ||
                  registerContraseniaController.text.isEmpty ||
                  confirmContraseniaController.text.isEmpty)
                  {
                    error++;
                    Utils.showSnackBar(
                      context: context,
                      title: "Todos los campos son necesarios",
                      color: Colors.red[300],
                      duracion: const Duration(seconds: 2)
                    );
                  }
                  else
                  {
                    if(!registerCorreoController.text.contains('@unah.hn'))
                    {
                      error++;
                      Utils.showSnackBar(
                        context: context,
                        title: "El correo debe tener @unah.hn",
                        color: Colors.red[300],
                        duracion: const Duration(seconds: 2)
                      );
                    }
          
                    if(registerContraseniaController.text.length < 6)
                    {
                      error++;
                      Utils.showSnackBar(
                        context: context,
                        title: "La contraseña debe tener minimo 6 caracteres",
                        color: Colors.red[300],
                        duracion: const Duration(seconds: 2)
                      );
                    }

                    RegExp exp = RegExp(r'[^a-zA-Z0-9]');
                    if (!exp.hasMatch(registerContraseniaController.text)) 
                    {
                      error++;
                      Utils.showSnackBar(
                        context: context,
                        title: "La contraseña debe tener al menos un caracter especial",
                        color: Colors.red[300],
                        duracion: const Duration(seconds: 2)
                      );
                    }

                    if(registerContraseniaController.text != confirmContraseniaController.text)
                    {
                      error++;
                      Utils.showSnackBar(
                        context: context,
                        title: "Las contraseñas no coinciden",
                        color: Colors.red[300],
                        duracion: const Duration(seconds: 2)
                      );
                    }

                    if(error == 0)
                    {
                      Utils.showSnackBar(
                        context: context,
                        title: "Registro exitoso",
                        color: Colors.green[300],
                        duracion: const Duration(seconds: 2)
                      );

                      final Map<String, dynamic> newuser = {
                        'nombre' : registerNombreController.text,
                        'correo' : registerCorreoController.text,
                        'telefono' : registerTelefonoController.text,
                        'contrasenia' : registerContraseniaController.text
                      };
                      usersdata.add(newuser);

                      print(usersdata);
                      await Future.delayed(const Duration(seconds: 2), () {
                        context.pop();
                      });
                    }
                  }
                }, 
              )
            ],
          );
        },
      )  
    );
  }
}