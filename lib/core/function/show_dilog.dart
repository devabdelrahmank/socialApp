import 'package:flutter/material.dart';
import 'package:silent_corner_social/core/utils/colors.dart';

import '../widgets/defult_custom_Button.dart';

Future customShowDialog(
  BuildContext context,
  Function() onpressedCamera,
  Function() onpressedGallery,
) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorData.mainColor,
          title: const Text(
            'Please Choose Picture From Camera or Gallery',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      width: double.infinity,
                      colorText: Colors.black,
                      text: 'Camera',
                      onpressed: onpressedCamera,
                      colorBorder: Colors.grey,
                      colorContainer: Colors.white54,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextButton(
                      width: double.infinity,
                      colorText: Colors.black,
                      text: 'Gallery',
                      onpressed: onpressedGallery,
                      colorBorder: Colors.grey,
                      colorContainer: Colors.white54,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
