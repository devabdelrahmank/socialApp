import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/core/utils/assets.dart';

// ignore: must_be_immutable
class ImageSignup extends StatelessWidget {
  File? image;
  final Function() onpressedImage;
  ImageSignup({
    super.key,
    required this.image,
    required this.onpressedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (image == null)
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: AssetImage(AssetsImage.noimage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          if (image != null)
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: FileImage(image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onpressedImage,
              icon: const Icon(
                CupertinoIcons.camera_fill,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
