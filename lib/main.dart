import 'package:flutter/material.dart';
import 'package:flutter_app/Provider/todo_provider.dart';
import 'package:flutter_app/Screens/add_data_screen.dart';
import 'package:flutter_app/Screens/home_screen.dart';
import 'package:flutter_app/Screens/login_screen.dart';
import 'package:flutter_app/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          "/login": (ctx) {
            return LoginScreen();
          },
          "/home": (ctx) {
            return HomeScreen();
          },
          "/adddata": (ctx) {
            return AddData();
          },
        },
      ),
    );
  }
}
