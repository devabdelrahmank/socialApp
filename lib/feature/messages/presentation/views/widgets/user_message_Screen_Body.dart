// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/widgets/chatScreenBody.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/widgets/message_ScreenI_tem.dart';

class MessageScreenBody extends StatelessWidget {
  const MessageScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List users = [];

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          snapshot.data!.docs.forEach((element) {
            {
              users.add((element.data()));
            }
          });
        }

        {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Scaffold(
              body: Center(
                child: Text('loding......'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong......'),
              ),
            );
          } else {
            return Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreenBody(
                          userModelname: snapshot.data!.docs[index]['name'],
                          userModelimage: snapshot.data!.docs[index]
                              ['imageprofile'],
                          userModeluid: snapshot.data!.docs[index]['uid'],
                        ),
                      ),
                    ),
                    child: MessageScreenItem(
                      name: snapshot.data!.docs[index]['name'],
                      image: snapshot.data!.docs[index]['imageprofile'],
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
