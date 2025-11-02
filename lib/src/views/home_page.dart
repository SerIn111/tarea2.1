
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2_1/api/todos.dart';
import 'package:tarea2_1/src/shared/utils.dart';
import 'package:tarea2_1/src/widgets/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red[50],
                    radius: 40,
                    child: Text(
                      'SA', 
                      style: TextStyle(
                        fontSize: 42, 
                        color: Colors.red[400]),
                      ), 
                  ),
                  const Text('Sergio Amaya' ),
                ],
              )
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
            ),
            const ListTile(
              leading: Icon(Icons.important_devices),
              title: Text('Importantes'),
            ),
            const ListTile(
              leading: Icon(Icons.warning),
              title: Text('Criticas'),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_rounded),
              title: const Text('Calendario'),
              onTap: (){
                context.pushNamed('new-todo');},
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Configuraciones'),
            ), 
            const Divider(),
            ListTile(
              leading: const Icon(Icons.calendar_month_rounded),
              title: const Text('Calendario'),
              onTap: (){},
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('TODO-App')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                context.pushNamed(
                  'update-todo',
                  pathParameters: {'id': '${todoList[index]['id']}'},
                  extra: todoList[index],
                );
                return false;
              }

              return await Utils.showConfirm(
                context: context,
                confirmButton: () {
                  context.pop(todoList.remove(todoList[index]));
                },
              );
            },
            onDismissed: (direction) {
              print(direction);
            },
            background: Container(
              padding: const EdgeInsets.only(left: 16),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red[50],
                  size: 30,
                ),
              ),
            ),
            secondaryBackground: Container(
              padding: const EdgeInsets.only(right: 16),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Modificar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[50],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.edit_outlined, color: Colors.blue[50], size: 30),
                ],
              ),
            ),

            key: Key(todoList[index]['id'].toString()),
            child: ItemList(todo: todoList[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          context.goNamed('new-todo');
        },
        child: Icon(Icons.add, color: Colors.blue[50]),
      ),
    );
  }
}
