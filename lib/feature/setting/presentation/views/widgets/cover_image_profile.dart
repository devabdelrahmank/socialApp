// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoverAndImageProfile extends StatelessWidget {
  final bool ischangeImage;
  final ImageProvider<Object> imageprofile;
  final ImageProvider<Object> imagecover;
  final Function()? onpressedCoverImage;
  final Function()? onpressedImage;
  const CoverAndImageProfile({
    super.key,
    required this.imagecover,
    required this.imageprofile,
    required this.ischangeImage,
    this.onpressedCoverImage,
    this.onpressedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: imagecover,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (ischangeImage == true)
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: onpressedCoverImage,
                      icon: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.black,
                      ),
                    ),
                  )
              ],
            ),
            Container(
              height: 50,
            )
          ],
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: imageprofile,
            ),
            if (ischangeImage == true)
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: onpressedImage,
                  icon: const Icon(
                    CupertinoIcons.camera,
                    color: Colors.black,
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
