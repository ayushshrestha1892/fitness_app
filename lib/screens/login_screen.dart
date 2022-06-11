import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //email fields
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator:

      onSaved: (value) {
        emailController.text = value!;
      },

      textInputAction: TextInputAction.next,
    );

    //email fields
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,

      //validator:

      onSaved: (value) {
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.done,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                emailField,
                passwordField,
              ],
            ),
          ),
        ),
      )),
    );
  }
}
