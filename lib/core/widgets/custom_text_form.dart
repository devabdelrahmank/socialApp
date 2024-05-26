import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double? sizePadding;
  final Color? colorSideEnableBorder;
  final Color? colorSideFocusedBorder;
  final Color? colorText;
  final String? text;
  final double? topLeft;
  final double? topright;
  final double? bottomLeft;
  final double? bottomRight;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? suffixPressed;
  final TextInputType? keyboardType;
  final String? Function(String?)? valeditor;
  final TextDirection? textDirection;
  final Function()? onTap;
  final bool? obscureText;
  final Color? fillColor;
  final Function(String)? onchanged;
  final int? maxLines;
  final Widget? counter;
  final bool filled;

  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.fillColor = Colors.white,
    this.obscureText = false,
    this.onTap,
    this.filled = false,
    this.counter,
    this.textDirection,
    required this.valeditor,
    this.sizePadding = 15,
    this.keyboardType = TextInputType.text,
    required this.text,
    this.colorSideEnableBorder = const Color.fromARGB(0, 0, 0, 0),
    this.colorSideFocusedBorder = const Color.fromARGB(0, 0, 0, 0),
    this.topLeft = 6,
    this.topright = 6,
    this.bottomLeft = 6,
    this.bottomRight = 6,
    required this.controller,
    this.textAlign = TextAlign.end,
    this.suffix,
    this.prefix,
    this.suffixPressed,
    this.colorText,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      enabled: true,
      obscureText: obscureText!,
      onTap: onTap,
      onChanged: (val) {},
      textDirection: textDirection,
      controller: controller!,
      textAlign: textAlign!,
      validator: valeditor,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        enabled: false,
        contentPadding: EdgeInsets.all(sizePadding!),
        suffixIconColor: Colors.grey,
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: colorText,
        ),
        fillColor: fillColor,
        filled: filled,
        counter: counter,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(topLeft ?? 6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(topLeft ?? 6),
        ),
        enabledBorder: outlineInputBorder1(
          colorSideEnableBorder,
          topLeft,
          topright,
          bottomLeft,
          bottomRight,
        ),
        focusedBorder: outlineInputBorder2(
          colorSideFocusedBorder,
          topLeft,
          topright,
          bottomLeft,
          bottomRight,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder1(
    Color? color,
    double? topLeft,
    double? topright,
    double? bottomLeft,
    double? bottomRight,
  ) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft!),
        topRight: Radius.circular(topright!),
        bottomLeft: Radius.circular(bottomLeft!),
        bottomRight: Radius.circular(bottomRight!),
      ),
      borderSide: BorderSide(
        color: colorSideEnableBorder!,
        width: 0.4,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder2(
    Color? color,
    double? topLeft,
    double? topright,
    double? bottomLeft,
    double? bottomRight,
  ) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft!),
        topRight: Radius.circular(topright!),
        bottomLeft: Radius.circular(bottomLeft!),
        bottomRight: Radius.circular(bottomRight!),
      ),
      borderSide: BorderSide(
        color: colorSideFocusedBorder!,
        width: 0.5,
      ),
    );
  }
}
