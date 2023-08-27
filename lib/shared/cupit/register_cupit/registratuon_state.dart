part of 'registratuon_cubit.dart';

@immutable
abstract class RegistratuonState {}

class RegistratuonInitial extends RegistratuonState {}


class RegisterLoadingState extends RegistratuonState{}
class RegisterSuccessState extends RegistratuonState{}
class RegisterErrorState extends RegistratuonState {
  late final String? error;

  RegisterErrorState(this.error);
}

class RegisterCreateUserLoadingState extends RegistratuonState{}
class RegisterCreateUserSuccessState extends RegistratuonState{
  String uId;
  RegisterCreateUserSuccessState(this.uId);
}
class RegisterCreateUserErrorState extends RegistratuonState {
  late final String? error;

  RegisterCreateUserErrorState(this.error);
}



class RegisterIsVisibleEye extends RegistratuonState{}