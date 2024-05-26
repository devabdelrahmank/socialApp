import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/core/widgets/custom_text_form.dart';

class DefultCustomfield extends StatelessWidget {
  final String? Function(String?)? validator;
  final String text;
  final TextEditingController controller;
  final IconData iconData;
  final IconData? iconDataPrefix;
  final bool? issuffix;
  final bool? obscureText;
  final Function()? onpressedSuffix;
  final Function(String)? onchanged;

  const DefultCustomfield({
    super.key,
    required this.validator,
    this.obscureText = false,
    required this.text,
    required this.controller,
    required this.iconData,
    this.issuffix,
    this.onpressedSuffix,
    this.iconDataPrefix = CupertinoIcons.eye,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomTextField(
        onchanged: onchanged,
        bottomLeft: 20,
        bottomRight: 20,
        topright: 20,
        topLeft: 20,
        suffix: issuffix == true
            ? IconButton(
                onPressed: onpressedSuffix,
                icon: Icon(iconDataPrefix),
              )
            : null,
        obscureText: obscureText,
        sizePadding: 18,
        valeditor: validator,
        text: text,
        controller: controller,
        colorSideEnableBorder: Colors.black54,
        colorSideFocusedBorder: Colors.black54,
        colorText: Colors.black54,
        textAlign: TextAlign.left,
        prefix: Icon(
          iconData,
          size: 30,
          color: Colors.black54,
        ),
      ),
    );
  }
}
