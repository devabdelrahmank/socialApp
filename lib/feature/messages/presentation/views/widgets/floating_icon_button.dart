// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form.dart';

class FloatActionButton extends StatelessWidget {
  var typeController = TextEditingController();
  final void Function() sendButton;
  FloatActionButton({
    super.key,
    required this.typeController,
    required this.sendButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomTextField(
        sizePadding: 20,
        valeditor: (val) {
          return null;
        },
        text: 'type your message',
        controller: typeController,
        textAlign: TextAlign.left,
        colorSideFocusedBorder: Colors.black,
        colorSideEnableBorder: Colors.black,
        suffix: IconButton(
          onPressed: sendButton,
          icon: const Icon(
            Icons.send,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
