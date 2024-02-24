import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNamefield = TextEditingController();
  final _passwordField = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showUsernameError = false;
  bool _showPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login ")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Login User",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      controller: _userNamefield,
                      decoration: InputDecoration(
                        label: Text("UserName"),
                        hintText: "UserName",
                        errorText: _showPasswordError
                            ? 'Please enter your username'
                            : null,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => {
                            setState(() {
                              _showUsernameError = _userNamefield.text.isEmpty;
                            })
                          },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter you username";
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Password",
                      errorText: _showPasswordError
                          ? 'Please enter your password'
                          : null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _showPasswordError ? Colors.red : Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {
                        _showPasswordError = false;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password should have 8 letters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              validateCredentials(context);
                            }
                          },
                          child: Text("Login")))
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void validateCredentials(BuildContext context) async {
    String userName = _userNamefield.text;
    String password = _passwordField.text;

    if (userName == 'admin' && password == 'password') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('user', true);
      Navigator.pushReplacementNamed(context, '/add');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid username or password',
            style: TextStyle(color: Colors.yellowAccent),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
