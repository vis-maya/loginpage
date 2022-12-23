// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_import, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loginpage/home_screen.dart';
import 'package:loginpage/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  bool _isHidden = true;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  String? errorText;
  bool validate = false;
  bool circular = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      // letterSpacing: 1,
                      color: HexColor('#626262'),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 58,
                        width: 335,
                        margin: const EdgeInsets.fromLTRB(20, 117, 20, 0),
                        // color: Colors.black,
                        color: HexColor('#F2F6FF'),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            focusNode: FocusNode(),
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: HexColor('#42C3A7')),
                                errorText: validate ? null : errorText,
                                // prefixIcon: Icon(Icons.email),
                                border: InputBorder.none),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            controller: emailController,
                          ),
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 335,
                        margin: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                        color: HexColor('#F2F6FF'),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: HexColor('#42C3A7')),
                              border: InputBorder.none,
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            style: const TextStyle(fontSize: 16),
                            controller: passController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const HomeScreen()),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('#42C3A7'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Create Account")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
