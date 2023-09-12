import 'package:flutter/material.dart';

class CoverProfileView extends StatelessWidget {
  const CoverProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft:  Radius.circular(5)),
          image: DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-photo/front-view-depressed-man-drinking_23-2149699045.jpg?t=st=1694481152~exp=1694481752~hmac=ccb2a9a576d26e8fb3821c137cf56c74c8d34ded7c964022900cb68c58baf78c'),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
