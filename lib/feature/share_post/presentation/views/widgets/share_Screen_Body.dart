import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/function/show_dilog.dart';
import 'package:silent_corner_social/core/utils/constant.dart';
import 'package:silent_corner_social/core/widgets/custom_text_form.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/share_post/presentation/views/widgets/button_share.dart';
import 'package:silent_corner_social/feature/share_post/presentation/views/widgets/image_name.dart';

class ShareScreenBody extends StatelessWidget {
  final textController = TextEditingController();

  ShareScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // ignore: unnecessary_null_comparison
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      getSnapshot(DocumentSnapshot snapshot, String key) {
                        try {
                          return snapshot.get(key);
                        } catch (error) {
                          return null;
                        }
                      }

                      if (snapshot.data != null) {
                        return Column(
                          children: [
                            ImageAndName(
                              name: snapshot.data!['name'] == null
                                  ? ''
                                  : snapshot.data!['name'],
                              image: snapshot.data!['imageprofile'],
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              valeditor: (p0) {
                                return null;
                              },
                              fillColor:
                                  const Color.fromARGB(153, 246, 237, 225),
                              colorText: const Color.fromARGB(152, 0, 0, 0),
                              textAlign: TextAlign.left,
                              text: 'Whats is Your Mind....',
                              controller: textController,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 100),
                            if (AppCubit.get(context).postImage != null)
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image: FileImage(
                                            AppCubit.get(context).postImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 200,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        AppCubit.get(context).closePostImage();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            const SizedBox(height: 20),
                            TextButton.icon(
                              onPressed: () {
                                customShowDialog(
                                  context,
                                  () {
                                    AppCubit.get(context)
                                        .getimagePostwithcamera();
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  () {
                                    AppCubit.get(context)
                                        .getimagePostwithgallery();
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.photo,
                                color: Colors.black,
                                size: 30,
                              ),
                              label: const Text(
                                'Add Picture',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (AppCubit.get(context).postImage != null ||
                                textController.text.isNotEmpty)
                              state is LoadingCreatePostState ||
                                      state is LoadinguploadPostImageState
                                  ? const Center(
                                      child: Text(
                                        'Loading...',
                                      ),
                                    )
                                  : ButtonShare(
                                      appCubit: AppCubit.get(context),
                                      textController: textController,
                                      datatime: now.toString(),
                                      name: snapshot.data!['name'],
                                      imageProfile:
                                          snapshot.data!['imageprofile'],
                                    ),
                          ],
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LinearProgressIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.white,
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
              ],
            ),
          ),
        );
        // else {
        //   return const Center(
        //     child: CircularProgressIndicator(
        //       color: Colors.black,
        //     ),
        //   );
        // }
      },
    );
  }
}
