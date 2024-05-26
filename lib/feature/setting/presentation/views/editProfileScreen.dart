// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';

import 'widgets/editProfilebody.dart';

class EditProfileScreen extends StatelessWidget {
  final String imagecover;
  final String imageprofile;
  final String name;
  final String phone;
  final String bio;
  const EditProfileScreen({
    super.key,
    required this.imagecover,
    required this.name,
    required this.bio,
    required this.imageprofile,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit profile'),
        ),
        body: EditProfilebody(
          imagecover: imagecover,
          name: name,
          bio: bio,
          imageprofile: imageprofile,
          phone: phone,
        ),
      ),
    );
  }
}
