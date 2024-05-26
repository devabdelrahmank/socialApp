// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class OnpressedEdit extends StatelessWidget {
  final Function() pressedAddphoto;
  final Function() pressedEditProfile;
  const OnpressedEdit({
    super.key,
    required this.pressedAddphoto,
    required this.pressedEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: pressedAddphoto,
              child: Container(
                height: 51,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5),
                ),
                child: const Center(
                  child: Text(
                    'Add Photos',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: pressedEditProfile,
            child: Container(
              height: 51,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5),
              ),
              child: const Icon(Icons.edit),
            ),
          ),
        ),
      ],
    );
  }
}
