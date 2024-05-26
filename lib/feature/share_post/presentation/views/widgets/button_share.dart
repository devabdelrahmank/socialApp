import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';

class ButtonShare extends StatelessWidget {
  final AppCubit appCubit;
  final TextEditingController textController;
  final String datatime;
  final String name;
  final String imageProfile;

  const ButtonShare({
    super.key,
    required this.appCubit,
    required this.textController,
    required this.datatime,
    required this.name,
    required this.imageProfile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (appCubit.postImage == null) {
          appCubit.createPost(
            text: textController.text,
            datatime: datatime,
            name: name,
            imageProfile: imageProfile,
          );
        } else {
          appCubit.uploadPostImage(
            text: textController.text,
            datatime: datatime,
            name: name,
            imageProfile: imageProfile,
          );
        }

        textController.clear();
      },
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 178, 179, 180),
        width: 100,
        height: 40,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(width: 5),
            Icon(Icons.send),
          ],
        ),
      ),
    );
  }
}
