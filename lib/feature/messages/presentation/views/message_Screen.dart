// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';

import 'widgets/user_message_Screen_Body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getallusers()
        ..getpostdata(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Chat'),
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ),
        body: const MessageScreenBody(),
      ),
    );
  }
}
