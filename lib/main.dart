import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea2_1/src/views/login.dart';
import 'package:tarea2_1/src/views/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/login', 
            name: 'login', 
            builder: (context, state) => Login(),
            routes: [
              GoRoute(
                path: '/register', 
                name: 'register', 
                builder: (context, state) => Register()
              ),
            ]
          ),
        ]
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tarea 2.1',
    );
  }
}