// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';

import 'widgets/home_Screen_Body.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showPopupMenu() async {
      await showMenu(
        context: context,
        color: const Color.fromARGB(255, 246, 237, 225),
        position: RelativeRect.fill,
        items: [
          PopupMenuItem<String>(
              value: 'Doge',
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )),
        ],
        elevation: 8.0,
      );
    }

    return BlocProvider(
      create: (context) => AppCubit()..getpostdata(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Silent Corner',
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              showPopupMenu();
            },
            icon: const Icon(Icons.settings),
          ),
        ),
        body: const HomeScreenBody(),
      ),
    );
  }
}
