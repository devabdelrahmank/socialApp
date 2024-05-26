// ignore_for_file: camel_case_types, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/function/flutter_toast.dart';
import 'package:silent_corner_social/core/function/show_dilog.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Signup_BackGround.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/cover_image_profile.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/defult_button.dart';
import 'package:silent_corner_social/feature/setting/presentation/views/widgets/text_form_field.dart';

class EditProfilebody extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final String imagecover;
  final String imageprofile;
  final String name;
  final String bio;
  final String phone;
  EditProfilebody({
    super.key,
    required this.imagecover,
    required this.name,
    required this.bio,
    required this.imageprofile,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is SuccessSignoutState) {
        toastMessage(state: ToastStates.SUCCESS, text: 'Delete Successfly');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupBackGround(),
          ),
        );
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CoverAndImageProfile(
                ischangeImage: true,
                imagecover: AppCubit.get(context).coverImage == null
                    ? NetworkImage(imagecover)
                    : FileImage(AppCubit.get(context).coverImage!)
                        as ImageProvider,
                imageprofile: AppCubit.get(context).profileImage == null
                    ? NetworkImage(imageprofile)
                    : FileImage(AppCubit.get(context).profileImage!)
                        as ImageProvider,
                onpressedCoverImage: () {
                  customShowDialog(
                    context,
                    () {
                      AppCubit.get(context).getCameraCover();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    () {
                      AppCubit.get(context).getgalleryCover();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  );
                },
                onpressedImage: () {
                  customShowDialog(
                    context,
                    () {
                      AppCubit.get(context).getCameraImage();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    () {
                      AppCubit.get(context).getgalleryimage();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  );
                },
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  if (AppCubit.get(context).profileImage != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: DefultButton(
                          onTap: () async {
                            await AppCubit.get(context).uploadprofileimage(
                              name: name,
                              phone: phone,
                              bio: bio,
                              imagecover: imagecover,
                              imageprofile: imageprofile,
                            );
                            AppCubit.get(context).profileImage = null;
                          },
                          title: 'Update Image',
                          width: double.infinity,
                        ),
                      ),
                    ),
                  if (AppCubit.get(context).coverImage != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: DefultButton(
                          onTap: () async {
                            await AppCubit.get(context).uploadCoverimage(
                              name: name,
                              phone: phone,
                              bio: bio,
                              imagecover: imagecover,
                              imageprofile: imageprofile,
                            );
                            AppCubit.get(context).coverImage = null;
                          },
                          title: 'Update cover',
                          width: double.infinity,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormFieldProfile(
                bioController: AppCubit.get(context).bioController,
                nameController: AppCubit.get(context).nameController,
                phoneController: AppCubit.get(context).phoneController,
                name: name,
                phone: phone,
                bio: bio == '' ? 'write your bio...' : bio,
              ),
              const SizedBox(height: 40),
              //!
              DefultButton(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    AppCubit.get(context).updateUserDetails(
                      name: name,
                      bio: bio,
                      phone: phone,
                      imagecover: imagecover,
                      imageprofile: imageprofile,
                    );
                  }
                },
                title: "Update",
              ),
              const SizedBox(height: 20),
              state is LodingSignoutState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        AppCubit.get(context).signout();
                      },
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
