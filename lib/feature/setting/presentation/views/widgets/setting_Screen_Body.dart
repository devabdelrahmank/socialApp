// ignore_for_file: camel_case_types, file_names, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/utils/constant.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/cover_image_profile.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/name_bio_profile.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/numbers_things.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/onpressed_edit.dart';
import '../editProfileScreen.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 10),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      CoverAndImageProfile(
                        ischangeImage: false,
                        imagecover: snapshot.data!['imagecover'] == null
                            ? NetworkImage(snapshot.data!['imagecover'])
                            : NetworkImage(snapshot.data!['imagecover']),
                        imageprofile: NetworkImage(
                          snapshot.data!['imageprofile'],
                        ),
                      ),
                      NameAndbioProfile(
                        name: snapshot.data!['name'] == ''
                            ? 'write your name'
                            : snapshot.data!['name'],
                        bio: snapshot.data!['bio'] == ''
                            ? 'write your bio'
                            : snapshot.data!['bio'],
                      ),
                      const SizedBox(height: 40),
                      const NumberThings(),
                      const SizedBox(height: 30),
                      OnpressedEdit(
                        pressedAddphoto: () {},
                        pressedEditProfile: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                  imageprofile: snapshot.data!['imageprofile'],
                                  imagecover: snapshot.data!['imagecover'],
                                  name: snapshot.data!['name'],
                                  bio: snapshot.data!['bio'],
                                  phone: snapshot.data!['phone'],
                                ),
                              ));
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }
              },
            ),
          ],
        );
        // } else {
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
