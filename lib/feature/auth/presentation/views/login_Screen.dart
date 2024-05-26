// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'widgets/Login_Screen_Body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreenBody(),
    );
  }
}
