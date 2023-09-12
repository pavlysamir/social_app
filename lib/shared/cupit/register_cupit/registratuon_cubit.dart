import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/usermodel.dart';
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
          isEmailVerified: false,);
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
      required bool isEmailVerified,}) {
    emit(RegisterCreateUserLoadingState());
    UserModel userModel = UserModel(
        name: name,
        phone: phone,
        email: email,
        image: 'https://img.freepik.com/free-photo/depressed-man-crying-side-view_23-2149699062.jpg?w=996&t=st=1694137272~exp=1694137872~hmac=9f8929ae103b9cad924c6a123bd9a434c6d07ac56af8637740cdfeeea9cd17d8',
        cover: 'https://img.freepik.com/free-photo/front-view-depressed-man-drinking_23-2149699045.jpg?t=st=1694481152~exp=1694481752~hmac=ccb2a9a576d26e8fb3821c137cf56c74c8d34ded7c964022900cb68c58baf78c',
        bio: 'write your bio...',
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
