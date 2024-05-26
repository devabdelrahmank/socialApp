import 'package:flutter/material.dart';

class LogoAndText extends StatelessWidget {
  final String logo;
  final String text;
  const LogoAndText({
    super.key,
    required this.logo,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          logo,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
