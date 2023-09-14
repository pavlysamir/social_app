import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/convert_font.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(IconBroken.Arrow___Left_2),
          onPressed: () {Navigator.pop(context);  },
        ),
        title:const Text('Add Post'),

      ),
    );
  }
}
