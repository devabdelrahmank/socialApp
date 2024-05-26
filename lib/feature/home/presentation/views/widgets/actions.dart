import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionsUser extends StatelessWidget {
  final void Function() love;
  final void Function() comment;
  final Widget loveicon;
  final IconData commenticon;
  const ActionsUser({
    super.key,
    required this.love,
    required this.comment,
    required this.loveicon,
    required this.commenticon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: comment,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  commenticon,
                  size: 25,
                ),
                const SizedBox(width: 5),
                const Text(
                  'Comment',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: love,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loveicon,
                const SizedBox(width: 5),
                const Text(
                  'Love',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
