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

class ProfileImagePickedSuccessState extends HomeState{}
class ProfileImagePickedErrorState extends HomeState{}

class CoverImagePickedSuccessState extends HomeState{}
class CoverImagePickedErrorState extends HomeState{}

class UploadProfileImageSuccessState extends HomeState{}
class UploadProfileImageErrorState extends HomeState{}


class UploadCoverImageSuccessState extends HomeState{}
class UploadCoverImageErrorState extends HomeState{}


class UserUpdateLoadingState extends HomeState{}
class UserUpdateErrorState extends HomeState{}
// create post
class CreatePostSuccessState extends HomeState {}
class CreatePostLoadingState extends HomeState {}
class CreatePostErrorState extends HomeState {}


class PostImagePickedSuccessState extends HomeState{}
class PostImagePickedErrorState extends HomeState{}
class RemovePostImagePickedState extends HomeState{}

class GetPostsSuccess extends HomeState {}
class GetPostsLoading extends HomeState {}
class GetPostsError extends HomeState {
  String error;
  GetPostsError({required this.error});
}
class LikePostsSuccess extends HomeState {}
class LikePostsError extends HomeState {
  String error;
  LikePostsError({required this.error});
}