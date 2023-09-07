import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
   emit(HomeGetUserLoading());
   print(uId);
   FirebaseFirestore.instance
       .collection('users')
       .doc(uId)
       .get()
       .then((value) {
         print(value.data());
        userModel= UserModel.fromJson(value.data()!);
         emit(HomeGetUserSuccess());
   }).catchError((error){
       print(error.toString());
     emit(HomeGetUserError(Error: error.toString()));
   });
 }

 int currentIndex = 0;
 List<Widget> Screens = [
   const FeedsScreen(),
   const ChatsScreen(),
   const UsersScreen(),
   const SettingsScreen()
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
