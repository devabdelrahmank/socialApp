import 'package:flutter/material.dart';

class AppBarChat extends StatelessWidget {
  final String name;
  final String image;
  const AppBarChat({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
