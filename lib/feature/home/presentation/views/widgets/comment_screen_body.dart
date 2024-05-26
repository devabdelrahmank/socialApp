// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/widgets/bubble_Chat.dart';

class CommentScreenBody extends StatelessWidget {
  final TextEditingController commentController;
  final String image;
  final String postId;
  const CommentScreenBody({
    super.key,
    required this.commentController,
    required this.image,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.network(
            image,
            height: 280,
          ),
        ),
        const SizedBox(height: 10),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? SizedBox(
                      height: size.shortestSide * 2,
                      child: ListView.builder(
                        itemBuilder: (context, index) => BubbleMessage(
                          textMessage: snapshot.data!.docs[index]['text'],
                          colorContainer: Colors.white,
                          alignment: Alignment.topRight,
                          topLeft: 30,
                          topRight: 0,
                          bottomLeft: 30,
                          bottomRight: 30,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  : !snapshot.hasData
                      ? SizedBox()
                      : SizedBox();
            })
      ],
    );
  }
}
