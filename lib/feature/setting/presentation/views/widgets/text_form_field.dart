import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form.dart';

class TextFormFieldProfile extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController bioController;
  final TextEditingController phoneController;
  final String name;
  final String bio;
  final String phone;
  const TextFormFieldProfile({
    super.key,
    required this.bioController,
    required this.nameController,
    required this.phoneController,
    required this.name,
    required this.bio,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: CustomTextField(
            valeditor: (val) {
              if (val!.isEmpty) {
                return 'please edit your name';
              }
              return null;
            },
            prefix: const Icon(Icons.person_2_outlined, size: 30),
            sizePadding: 20,
            text: name,
            controller: nameController,
            textAlign: TextAlign.left,
            fillColor: null,
            colorSideEnableBorder: Colors.black,
            colorSideFocusedBorder: Colors.black),
      ),
      Padding(
          padding: const EdgeInsets.all(10),
          child: CustomTextField(
              valeditor: (val) {
                if (val!.isEmpty) {
                  return 'please edit your bio';
                }
                return null;
              },
              prefix: const Icon(Icons.title, size: 30),
              sizePadding: 20,
              text: bio,
              controller: bioController,
              textAlign: TextAlign.left,
              fillColor: null,
              colorSideEnableBorder: Colors.black,
              colorSideFocusedBorder: Colors.black)),
      Padding(
        padding: const EdgeInsets.all(10),
        child: CustomTextField(
          valeditor: (val) {
            if (val!.isEmpty) {
              return 'please edit your phone';
            }
            return null;
          },
          prefix: const Icon(Icons.phone_android, size: 30),
          sizePadding: 20,
          text: phone,
          controller: phoneController,
          textAlign: TextAlign.left,
          fillColor: null,
          colorSideEnableBorder: Colors.black,
          colorSideFocusedBorder: Colors.black,
        ),
      )
    ]);
  }
}
