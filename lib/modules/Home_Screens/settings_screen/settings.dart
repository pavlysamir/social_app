import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/layouts/home_layout/cupit/home_cubit.dart';
import 'package:social_app/modules/Home_Screens/settings_screen/settings_views/cover_profile_view.dart';
import 'package:social_app/modules/Home_Screens/settings_screen/settings_views/profile_image_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          var userModel = HomeCubit.get(context).userModel;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.28,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: CoverProfileView(image: '${userModel!.cover}',),
                      ),
                      ProfileImageView(image: '${userModel.image}',),
                    ],
                  ),
                ),
                const  SizedBox(
                  height: 5,
                ),
                Text('${userModel.name}',style: Theme.of(context).textTheme.bodyLarge,),
                const  SizedBox(
                  height: 5,
                ),
                Text('${userModel.bio}',style: Theme.of(context).textTheme.bodySmall,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('100',style: Theme.of(context).textTheme.bodyLarge,),
                              Text('posts',style: Theme.of(context).textTheme.bodySmall,),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('125',style: Theme.of(context).textTheme.bodyLarge,),
                              Text('photos',style: Theme.of(context).textTheme.bodySmall,),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('10k',style: Theme.of(context).textTheme.bodyLarge,),
                              Text('followers',style: Theme.of(context).textTheme.bodySmall,),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('500',style: Theme.of(context).textTheme.bodyLarge,),
                              Text('followings',style: Theme.of(context).textTheme.bodySmall,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: (){}, child:const Text('Add photos'))),
                    const SizedBox(width: 10,),
                    OutlinedButton(onPressed: (){}, child:const Icon(IconBroken.Edit)),
                  ],
                )
              ],
            ),
          );
        },
        );
  }
}