import 'package:flutter/material.dart';

import 'widgets/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPasswordBody(),
    );
  }
}
