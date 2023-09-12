import 'package:flutter/material.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add Post'),
      ),
    );
  }
}
