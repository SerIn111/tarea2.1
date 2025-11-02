import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2_1/api/todos.dart';
import 'package:tarea2_1/src/shared/utils.dart';

class AdminTodoPage extends StatelessWidget {
  AdminTodoPage({super.key, this.todo});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  FocusNode titleFocus = FocusNode();

  Map<String, dynamic>? todo;

  @override
  Widget build(BuildContext context) {
    final todoId = GoRouterState.of(context).pathParameters['id'];

    if (todo != null) {
      titleController.text = todo!['title'];
      descriptionController.text = todo!['description'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo == null
              ? 'Creación de una nueva tarea'
              : 'Editando la tarea # $todoId',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            TextField(
              focusNode: titleFocus,
              controller: titleController,
              decoration: InputDecoration(
                label: const Text('Titulo'),
                // hint: Text('Eje. Crear opción de eliminar'), //Si lo descomento me da error
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.text_fields_rounded),
              ),

              maxLines: 1,
              maxLength: 50,
              obscureText: false,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(label: Text('Descripción')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          if (titleController.text.isEmpty) {
            Utils.showSnackBar(
              context: context,
              title: "El titulo es obligatorio",
              color: Colors.red,
              duracion: const Duration(seconds: 1)
            );

            return;
          }

          final Map<String, dynamic> newTodo = {
            'id': todoList.length + 1,
            'title': titleController.text,
            'description': descriptionController.text,
            'completed': false,
          };

          if (todoId == null) {
            todoList.add(newTodo);
          } else {
            final indice = todoList.indexWhere(
              (todo) => todo['id'].toString() == todoId,
            );

            todoList[indice] = newTodo;
          }

          Utils.showSnackBar(
            context: context,
            title: "Tarea creada correctamente",
            duracion: const Duration(seconds: 1)
          );

          titleController.text = '';
          descriptionController.text = '';

          context.pop();
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}