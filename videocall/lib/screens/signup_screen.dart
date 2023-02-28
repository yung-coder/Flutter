import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocall/firebase/auth_methods.dart';
import 'package:videocall/screens/home_screen.dart';
import 'package:videocall/widgets/custom_button.dart';
import 'package:videocall/widgets/custom_textfiled.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/Signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  void signupUser() async {
    bool res = await _authMethods.signUpUser(context, _emailController.text,
        _usernameController.text, _passwordController.text);

    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sig up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFiled(controller: _emailController),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFiled(controller: _usernameController),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFiled(controller: _passwordController),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(text: 'Sign up', onTap: signupUser)
            ],
          ),
        ),
      ),
    );
  }
}
