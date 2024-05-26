// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/widgets/custom_text_form.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/home/presentation/views/widgets/comment_screen_body.dart';

class CommentScreen extends StatelessWidget {
  final commentController = TextEditingController();
  final String image;
  final String index;
  CommentScreen({
    super.key,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text('Comments'),
        ),
        body: CommentScreenBody(
          image: image,
          commentController: commentController,
          postId: index,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomTextField(
            sizePadding: 20,
            valeditor: (val) {
              return null;
            },
            text: 'type your message',
            controller: commentController,
            textAlign: TextAlign.left,
            colorSideFocusedBorder: Colors.black,
            colorSideEnableBorder: Colors.black,
            filled: true,
            fillColor: const Color.fromARGB(255, 246, 237, 225),
            suffix: IconButton(
              onPressed: () {
                AppCubit.get(context).sendComment(
                  index,
                  commentController.text,
                );

                commentController.clear();
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(
                Icons.send,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
