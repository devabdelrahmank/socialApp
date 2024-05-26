// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double height;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;
  final double? width;
  final Color? colorContainer;
  final Color? colorText;
  final Color colorBorder;
  final String? text;
  final Function()? onpressed;

  const CustomTextButton({
    this.bottomLeft = 6,
    this.bottomRight = 6,
    this.topRight = 6,
    this.topLeft = 6,
    super.key,
    this.height = 51,
    required this.width,
    this.colorContainer = Colors.transparent,
    required this.colorText,
    required this.text,
    required this.onpressed,
    this.colorBorder = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeft!),
            bottomRight: Radius.circular(bottomRight!),
            topLeft: Radius.circular(topLeft!),
            topRight: Radius.circular(topRight!),
          ),
          color: colorContainer,
          border: Border.all(color: colorBorder, width: 0.5),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 18,
              color: colorText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
