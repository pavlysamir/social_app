import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/styles/convert_font.dart';
import '../../modules/Home_Screens/add_post_screen/add_post_view.dart';
import '../../shared/components/components.dart';
import 'cupit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is NewPostState){
          navigateTo(context,const NewPostView());
        }
      },
      builder: (context, state) {
        var cupit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cupit.titels[cupit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(IconBroken.Notification)),
              IconButton(onPressed: () {}, icon: const Icon(IconBroken.Search)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cupit.currentIndex,
            onTap: (index) {
              cupit.changeButtonNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Paper_Upload), label: 'post'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Location), label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Setting'),
            ],
          ),
          body: ConditionalBuilder(
              condition: cupit.userModel != null,
              builder: (context)=>cupit.screens[cupit.currentIndex],
              fallback: (context)=>const Center(
                child: CircularProgressIndicator(),
              )),
        );
      },
    );
  }
}
