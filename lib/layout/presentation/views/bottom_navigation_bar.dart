// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) => Scaffold(
          body: AppCubit.get(context)
              .buildScreens[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              AppCubit.get(context).changebottom(index);
              if (index == 0) {
                AppCubit.get(context).getpostdata();
              }
              if (index == 1) {
                AppCubit.get(context).getallusers();
              }
            },
            currentIndex: AppCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.house,
                  color: CupertinoColors.systemGrey,
                ),
                activeIcon: Icon(
                  CupertinoIcons.house_fill,
                  color: CupertinoColors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text,
                  color: CupertinoColors.systemGrey,
                ),
                activeIcon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: CupertinoColors.black,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.add_circled,
                  color: CupertinoColors.systemGrey,
                ),
                activeIcon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.black,
                ),
                label: 'add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  color: CupertinoColors.systemGrey,
                ),
                activeIcon: Icon(
                  CupertinoIcons.profile_circled,
                  color: CupertinoColors.black,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
