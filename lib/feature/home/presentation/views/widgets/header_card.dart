import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String imageprofile;
  final String name;
  final String time;
  final Function() onpressedmenue;
  const HeaderCard({
    super.key,
    required this.imageprofile,
    required this.name,
    required this.time,
    required this.onpressedmenue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            imageprofile,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: onpressedmenue,
          icon: const Icon(
            Icons.delete_forever,
            size: 30,
          ),
        )
      ],
    );
  }
}
