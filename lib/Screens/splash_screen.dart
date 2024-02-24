import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat(reverse: true);
    // Delayed navigation to the login screen after 5 seconds
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isTokenPresent(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Text(
            'ToDo App',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> CheckIsLogin(ctx) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(ctx).pushReplacementNamed('/login');
  }

  Future<void> isTokenPresent(ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isPresent = await prefs.getBool('user');
    if (isPresent == null || isPresent == false) {
      CheckIsLogin(ctx);
    } else {
      Navigator.of(ctx).pushReplacementNamed('/home');
    }
  }
}
