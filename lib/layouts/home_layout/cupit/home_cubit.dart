import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/modules/Home_Screens/chats_screen.dart';
import 'package:social_app/modules/Home_Screens/feeds_screen.dart';
import 'package:social_app/modules/Home_Screens/settings.dart';
import 'package:social_app/modules/Home_Screens/users.dart';
import 'package:social_app/shared/constance/constance.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 static HomeCubit get(context) =>BlocProvider.of(context);
 UserModel? userModel;
 void getData(){
   FirebaseFirestore.instance
       .collection('users')
       .doc(uId)
       .get()
       .then((value) {

   }).catchError((error){

   });
 }

 int currentIndex = 0;
 List<Widget> Screens = [
   FeedsScreen(),
   ChatsScreen(),
   UsersScreen(),
   SettingsScreen()
 ];

 List<String> titels = [
   'Home',
   'Chats',
   'Users',
   'Setting'
 ];

 void changeBottonNav(int index){
   currentIndex = index;
   emit(ChangeButtonNavState());
 }
}
