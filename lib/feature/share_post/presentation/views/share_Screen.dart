// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

import 'widgets/share_Screen_Body.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create Post'),
      ),
      body: ShareScreenBody(),
    );
  }
}
