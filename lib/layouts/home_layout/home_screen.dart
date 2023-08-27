import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/styles/convert_font.dart';
import 'cupit/home_cubit.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var cupit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cupit.titels[cupit.currentIndex]),
            actions: [
              IconButton(onPressed: (){},
                  icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: (){},
                  icon: Icon(IconBroken.Search)),
            ],
          ),
          body: cupit.Screens[cupit.currentIndex],
          bottomNavigationBar: BottomNavigationBar
            (
            currentIndex: cupit.currentIndex,
            onTap: (index){
              cupit.changeBottonNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home,),
                label: 'Home'
              ),
              BottomNavigationBarItem(icon: Icon(IconBroken.Chat),
                  label: 'Chat'
              ),
              BottomNavigationBarItem(icon: Icon(
                IconBroken.Location
              ),
              label: 'Users'
              ),
              BottomNavigationBarItem(icon: Icon(
                IconBroken.Setting
              ),
              label: 'Setting'
              ),
            ],
          ),
        );
      },
    );
  }
}
