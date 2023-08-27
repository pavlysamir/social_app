

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  String uId;
  LoginSuccessState({required this.uId});
}
class LoginErrorState extends LoginState
{
  final String? error;

  LoginErrorState(this.error);
}
class LoginIsVisibleEye extends LoginState{}


