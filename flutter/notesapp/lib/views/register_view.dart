import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Column(children: [
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

              print(userCreds);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('Weak password');
              } else if (e.code == 'email-already-in-use') {
                print('Email Already in use');
              } else if (e.code == 'invalid-email') {
                print('Invalid email');
              }
            }
          },
          child: const Text('Register')),
    ]);
  }
}
