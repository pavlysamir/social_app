import 'package:flutter/material.dart';

class ProfileImageView extends StatelessWidget {
   const ProfileImageView({Key? key, required this.image}) : super(key: key);
   final String image;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 63,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
