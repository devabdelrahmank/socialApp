// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/home/presentation/views/comment_screen.dart';
import 'package:silent_corner_social/feature/home/presentation/views/widgets/items_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No Posts'));
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(child: Text('No Internet Connection'));
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Scaffold(
                  body: Center(
                    child: Text('Add Some Posts'),
                  ),
                );
              }
              if (snapshot.hasError || !snapshot.hasData) {
                return const Scaffold(
                  body: Center(
                    child: Text('Loading'),
                  ),
                );
              }

              List<String> postsId = [];

              snapshot.data!.docs.forEach((element) {
                {
                  postsId.add(element.id);
                  debugPrint(postsId.toString());
                }
              });

              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => snapshot.data!.docs.isEmpty
                      ? Container()
                      : ItemsCard(
                          onPressedMenu: () {
                            AppCubit.get(context).deletePost(postsId[index]);
                          },
                          imageprofile: snapshot.data!.docs[index]['imageprof'],
                          name: snapshot.data!.docs[index]['name'],
                          time: snapshot.data!.docs[index]['time'],
                          titlebody: snapshot.data!.docs[index]['text'],
                          imagebody: snapshot.data!.docs[index]['imagepost'],
                          numComment: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('posts')
                                  .doc(postsId[index])
                                  .collection('comments')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? '${snapshot.data!.docs.length} Comments'
                                      : '0 Comments',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                );
                              }),
                          numLove: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('posts')
                                  .doc(postsId[index])
                                  .collection('likes')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? '${snapshot.data!.docs.length} ❤️'
                                      : '0 ❤️',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                );
                              }),
                          love: () {
                            AppCubit.get(context).likepost(postsId[index]);
                          },
                          comment: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentScreen(
                                  image: snapshot.data!.docs[index]
                                      ['imagepost'],
                                  index: postsId[index],
                                ),
                              ),
                            );
                          },
                          loveicon: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('posts')
                                .doc(postsId[index])
                                .collection('likes')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              return Icon(
                                !snapshot.hasData
                                    ? CupertinoIcons.heart
                                    : snapshot.data!.exists
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                              );
                            },
                          ),
                          commenticon: CupertinoIcons.chat_bubble,
                        ),
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: Text('Loading'),
                  ),
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
//  Text(
//           '$numComment Comments',
//           style: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),