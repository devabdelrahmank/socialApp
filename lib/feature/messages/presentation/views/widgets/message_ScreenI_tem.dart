// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class MessageScreenItem extends StatelessWidget {
  final String name;
  final String image;
  const MessageScreenItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(width: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Color.fromARGB(67, 0, 0, 0),
          thickness: 0.4,
        )
      ],
    );
  }
}
