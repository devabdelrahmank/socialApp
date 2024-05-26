import 'package:flutter/material.dart';

class ImageAndName extends StatelessWidget {
  final String name;
  final String image;
  const ImageAndName({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(image),
            ),
          ],
        ),
      ],
    );
  }
}
