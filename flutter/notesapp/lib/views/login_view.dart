import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  .signInWithEmailAndPassword(email: email, password: password);

              print(userCreds);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print("User not found");
              } else if (e.code == 'wrong-password') {
                print('Wrong Password');
              }
            }
          },
          child: const Text('Login')),
    ]);
  }
}
