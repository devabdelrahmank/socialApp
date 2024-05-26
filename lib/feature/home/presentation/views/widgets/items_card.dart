import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent_corner_social/feature/home/presentation/views/widgets/actions.dart';
import 'package:silent_corner_social/feature/home/presentation/views/widgets/header_card.dart';
import 'package:silent_corner_social/feature/home/presentation/views/widgets/num_actions.dart';

import '../../../../../core/utils/colors.dart';

class ItemsCard extends StatelessWidget {
  final String imageprofile;
  final String name;
  final String time;
  final String titlebody;
  final String imagebody;
  final Widget numComment;
  final Widget numLove;
  final void Function() love;
  final void Function() comment;
  final void Function() onPressedMenu;
  final Widget loveicon;
  final IconData commenticon;
  const ItemsCard({
    super.key,
    required this.imageprofile,
    required this.name,
    required this.time,
    required this.titlebody,
    required this.imagebody,
    required this.numComment,
    required this.numLove,
    required this.love,
    required this.comment,
    required this.loveicon,
    required this.commenticon,
    required this.onPressedMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: ColorData.mainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 5),
            HeaderCard(
              imageprofile: imageprofile,
              name: name,
              time: time,
              onpressedmenue: onPressedMenu,
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.black,
              thickness: 0.4,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  titlebody,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(imagebody),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            NumActionsUser(
              numComment: numComment,
              numLove: numLove,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.4,
            ),
            ActionsUser(
              love: love,
              comment: comment,
              loveicon: loveicon,
              commenticon: commenticon,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
