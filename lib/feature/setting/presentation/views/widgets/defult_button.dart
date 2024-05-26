import 'package:flutter/material.dart';

class DefultButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final double width;
  const DefultButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width = 161.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 51,
        decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.black),
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(173, 255, 255, 255),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
