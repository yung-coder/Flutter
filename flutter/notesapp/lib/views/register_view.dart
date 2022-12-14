import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:notesapp/constants/routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;

  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Enter your email"),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: "Enter your password"),
        ),
        TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCreds = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password);

                devtools.log(userCreds.toString());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  devtools.log('Weak password');
                } else if (e.code == 'email-already-in-use') {
                  devtools.log('Email Already in use');
                } else if (e.code == 'invalid-email') {
                  devtools.log('Invalid email');
                }
              }
            },
            child: const Text('Register')),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text('Already registered login'))
      ]),
    );
  }
}
