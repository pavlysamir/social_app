part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetUserSuccess extends HomeState {}
class HomeGetUserLoading extends HomeState {}
class HomeGetUserError extends HomeState {
  String Error;
  HomeGetUserError({required this.Error});
}

class ChangeButtonNavState extends HomeState{}
