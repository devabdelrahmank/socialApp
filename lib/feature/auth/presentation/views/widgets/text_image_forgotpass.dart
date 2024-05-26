import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class TextImageForgotpass extends StatelessWidget {
  const TextImageForgotpass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 118),
        Text(
          'Forgot Password ?',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 49),
        Image(
          image: AssetImage(AssetsImage.lock),
          width: 200,
          height: 200,
          color: Colors.black54,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 30),
        Text(
          'Enter the email address associated with your account below. We will send you a password recovery link',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
