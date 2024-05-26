import 'package:flutter/material.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Login_BackGround.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Signup_BackGround.dart';

class HaveAnAccountAndNav extends StatelessWidget {
  final String text;
  final bool navegatetologin;

  const HaveAnAccountAndNav({
    super.key,
    required this.text,
    required this.navegatetologin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => navegatetologin == true
                    ? const LoginBackGround()
                    : const SignupBackGround(),
              ),
            );
          },
          child: Text(
            navegatetologin == true ? 'Login' : 'Sign Up',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
