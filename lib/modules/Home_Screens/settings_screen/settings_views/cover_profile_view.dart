import 'package:flutter/material.dart';

class CoverProfileView extends StatelessWidget {
  const CoverProfileView({Key? key, required this.image}) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
          borderRadius:const BorderRadius.only(topRight: Radius.circular(5),topLeft:  Radius.circular(5)),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
