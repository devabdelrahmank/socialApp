import 'package:flutter/material.dart';

import '../../../../../core/widgets/defult_Custom_field.dart';

class SignupField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final IconData iconsuffix;
  final Function() onpressedSuffix;
  final Function(String)? onchangedname;
  final Function(String)? onchangedphone;
  final Function(String)? onchangedEmail;
  final Function(String)? onchangedPassword;

  final bool obscureText;

  const SignupField({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.iconsuffix,
    required this.onpressedSuffix,
    required this.obscureText,
    this.onchangedname,
    this.onchangedphone,
    this.onchangedEmail,
    this.onchangedPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefultCustomfield(
          onchanged: onchangedname,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter your name';
            }
            return null;
          },
          text: 'Enter your name',
          controller: nameController,
          iconData: Icons.person_2_outlined,
        ),
        DefultCustomfield(
          onchanged: onchangedphone,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter your phone';
            }
            return null;
          },
          text: 'Enter your phone',
          controller: phoneController,
          iconData: Icons.phone,
        ),
        DefultCustomfield(
          onchanged: onchangedEmail,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter your email';
            }
            return null;
          },
          text: 'Enter your email',
          controller: emailController,
          iconData: Icons.email_outlined,
        ),
        DefultCustomfield(
          onchanged: onchangedPassword,
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter your password';
            }
            return null;
          },
          text: 'Enter your password',
          controller: passwordController,
          iconData: Icons.lock,
          iconDataPrefix: iconsuffix,
          issuffix: true,
          obscureText: obscureText,
          onpressedSuffix: onpressedSuffix,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
