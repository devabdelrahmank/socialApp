import 'package:flutter/material.dart';

class NumActionsUser extends StatelessWidget {
  final Widget numComment;
  final Widget numLove;
  const NumActionsUser({
    super.key,
    required this.numComment,
    required this.numLove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        numComment,
        const Spacer(),
        numLove,
      ],
    );
  }
}
