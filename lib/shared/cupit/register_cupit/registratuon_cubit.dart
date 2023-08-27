import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/shared/cupit/login_cupit/login_state.dart';
part 'registratuon_state.dart';

class RegistratuonCubit extends Cubit<RegistratuonState> {
  RegistratuonCubit() : super(RegistratuonInitial());

  static RegistratuonCubit? get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      createUser(
          name: name,
          email: email,
          phone: phone,
          uId: credential.user!.uid,
          isEmailVerified: false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(RegisterErrorState(e.code));
    } catch (e) {
      print(e);
    }
  }






  void createUser(
      {required String name,
      required String email,
      required String phone,
      required String uId,
      required bool isEmailVerified}) {
    emit(RegisterCreateUserLoadingState());
    UserModel userModel = UserModel(
        name: name,
        phone: phone,
        email: email,
        uId: uId,
        isEmailVerified: isEmailVerified);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uId).set(userModel.toMap()).then((value) {
      emit(RegisterCreateUserSuccessState(uId));
    }).catchError((error) {
      emit(RegisterCreateUserErrorState(error.toString()));
    });
  }

  IconData iconData = Icons.remove_red_eye;
  bool obSurepass = false;

  void isVisibleeye() {
    obSurepass = !obSurepass;
    iconData = obSurepass ? Icons.visibility_off : Icons.remove_red_eye;

    emit(RegisterIsVisibleEye());
  }
}
