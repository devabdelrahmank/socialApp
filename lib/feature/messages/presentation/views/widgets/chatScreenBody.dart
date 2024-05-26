// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/utils/constant.dart';
import 'package:silent_corner_social/core/widgets/custom_text_form.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/widgets/app_bar_chat.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/widgets/bubble_Chat.dart';

// ignore: must_be_immutable
class ChatScreenBody extends StatelessWidget {
  final String userModelname;
  final String userModelimage;
  final String userModeluid;
  ChatScreenBody({
    super.key,
    required this.userModelname,
    required this.userModelimage,
    required this.userModeluid,
  });
  TextEditingController sendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hight = MediaQuery.of(context).size;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
              .collection('chat')
              .doc(userModeluid)
              .collection('messages')
              .orderBy('dateTime', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            return BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                print(userModeluid);

                return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    title: AppBarChat(
                      image: userModelimage,
                      name: userModelname,
                    ),
                  ),
                  body: snapshot.hasData
                      ? SizedBox(
                          height: hight.height - 150,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) => userModeluid ==
                                      snapshot.data!.docs[index]['senderId']
                                  ? BubbleMessage(
                                      textMessage: snapshot.data!.docs[index]
                                          ['text'],
                                      colorContainer: const Color.fromARGB(
                                          255, 244, 139, 54),
                                      alignment: Alignment.topLeft,
                                      topLeft: 0,
                                      topRight: 30,
                                      bottomLeft: 30,
                                      bottomRight: 30,
                                    )
                                  : BubbleMessage(
                                      textMessage: snapshot.data!.docs[index]
                                          ['text'],
                                      colorContainer: Colors.white,
                                      alignment: Alignment.topRight,
                                      topLeft: 30,
                                      topRight: 0,
                                      bottomLeft: 30,
                                      bottomRight: 30,
                                    )),
                        )
                      : snapshot.connectionState == ConnectionState.waiting
                          ? const Center(child: CircularProgressIndicator())
                          : Container(),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Row(children: [
                      Expanded(
                        child: CustomTextField(
                          valeditor: (val) {
                            return;
                          },
                          text: 'send message',
                          textAlign: TextAlign.left,
                          controller: sendController,
                          colorSideEnableBorder: Colors.black,
                          colorSideFocusedBorder: Colors.black,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).sendmessage(
                              text: sendController.text,
                              datatime: now.toString(),
                              receiverId: userModeluid,
                            );
                            sendController.clear();
                            FocusScope.of(context).unfocus();
                          },
                          icon: const Icon(Icons.send))
                    ]),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
