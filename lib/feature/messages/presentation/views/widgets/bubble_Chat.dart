// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:silent_corner_social/core/utils/colors.dart';

// ignore: camel_case_types
class BubbleMessage extends StatelessWidget {
  final Alignment alignment;
  final double topLeft;
  final double topRight;
  final double bottomRight;
  final double bottomLeft;
  final String textMessage;
  final Color colorContainer;

  const BubbleMessage({
    super.key,
    this.colorContainer = ColorData.mainColor,
    required this.textMessage,
    this.topLeft = 6,
    this.topRight = 6,
    this.bottomLeft = 6,
    this.bottomRight = 6,
    this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Align(
        alignment: alignment,
        child: Container(
          decoration: BoxDecoration(
            color: colorContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomRight: Radius.circular(bottomRight),
              bottomLeft: Radius.circular(bottomLeft),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 30,
              bottom: 20,
              right: 30,
            ),
            child: Text(
              textMessage,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    colorContainer == Colors.grey ? Colors.white : Colors.black,
                //     ? ColorsManager.blacExtraMeduim
                //     : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
