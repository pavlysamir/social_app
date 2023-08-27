import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cupit/login_cupit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



  static LoginCubit? get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async{
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print(credential.user!.email);
      print(credential.user!.uid);
      emit(LoginSuccessState(uId: credential.user!.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      emit(LoginErrorState(e.code));
    }


  }


  IconData iconData = Icons.remove_red_eye;
  bool obSurepass = true;

  void isVisibleeye(){

      obSurepass = !obSurepass;
      iconData = obSurepass? Icons.visibility_off :Icons.remove_red_eye;

      emit(LoginIsVisibleEye());

  }
}

