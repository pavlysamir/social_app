import 'package:flutter/material.dart';
import 'package:social_app/modules/Home_Screens/settings_screen/settings_views/cover_profile_view.dart';
import 'package:social_app/modules/Home_Screens/settings_screen/settings_views/profile_image_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         SizedBox(
           height: MediaQuery.of(context).size.height*0.28,
           child:const Stack(
             alignment: Alignment.bottomCenter,
             children: [
               Align(
                  alignment: Alignment.topCenter,
                 child: CoverProfileView(),
               ),
               ProfileImageView(),
             ],
           ),
         )
        ],
      ),
    );
  }
}