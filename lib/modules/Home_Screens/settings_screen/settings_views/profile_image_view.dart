import 'package:flutter/material.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 63,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage('https://img.freepik.com/free-photo/depressed-man-crying-side-view_23-2149699062.jpg?w=996&t=st=1694481454~exp=1694482054~hmac=03470a5347430c74f461cf1c36469f20b946045394d85e13a56e1540a454b264'),
      ),
    );
  }
}
