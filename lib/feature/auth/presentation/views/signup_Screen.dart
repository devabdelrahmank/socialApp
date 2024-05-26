// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'widgets/Signup_Screen_Body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupScreenBody(),
    );
  }
}
