part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetUserSuccess extends HomeState {}
class HomeGetUserLoading extends HomeState {}
class HomeGetUserError extends HomeState {
  String error;
  HomeGetUserError({required this.error});
}

class ChangeButtonNavState extends HomeState{}
class NewPostState extends HomeState{}
