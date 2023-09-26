import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/modules/Home_Screens/chat_screens/chats_screen.dart';
import 'package:social_app/modules/Home_Screens/feeds_screens/feeds_screen.dart';
import 'package:social_app/modules/Home_Screens/settings_screen/settings.dart';
import 'package:social_app/modules/Home_Screens/users_screen/users.dart';
import 'package:social_app/shared/constance/constance.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUserData() {
    emit(HomeGetUserLoading());
    print(uId);
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      emit(HomeGetUserSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserError(error: error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const Text(''),
    const UsersScreen(),
    const SettingsScreen()
  ];

  List<String> titels = ['Home', 'Chats', 'Add Post', 'Users', 'Setting'];

  void changeButtonNav(int index) {
    if (index == 2) {
      emit(NewPostState());
    } else {
      currentIndex = index;
      emit(ChangeButtonNavState());
    }
  }

  File? profileImage;
  Future<void> getProfileImageFromDevice() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print('No error selected');
      emit(ProfileImagePickedErrorState());
    }
  }

  File? coverImage;
  Future<void> getCoverImageFromDevice() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      coverImage = File(pickedImage.path);
      emit(CoverImagePickedSuccessState());
    } else {
      print('No error selected');
      emit(CoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());
    final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(UploadProfileImageSuccessState());
        print(value);
        updateUser(name: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());
    final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(UploadCoverImageSuccessState());
        print(value);
        updateUser(name: name, phone: phone, bio: bio, cover: value);
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoadingState());
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: userModel!.email,
      image: image ?? userModel!.image,
      cover: cover ?? userModel!.cover,
      bio: bio,
      uId: userModel!.uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
      emit(UserUpdateErrorState());
    });
  }

  File? postImage;
  Future<void> getPostImageFromDevice() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      postImage = File(pickedImage.path);
      emit(PostImagePickedSuccessState());
    } else {
      print('No error selected');
      emit(PostImagePickedErrorState());
    }
  }

  void removePostImageFromDevice() {
    postImage = null;
    emit(RemovePostImagePickedState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(CreatePostLoadingState());
    final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(dateTime: dateTime, text: text, postImage: value);
      }).catchError((error) {
        emit(CreatePostErrorState());
      });
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
      dateTime: dateTime,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {

      for (var element in value.docs) {
        posts.add(PostModel.fromJson(element.data()));
        postsId.add(element.id);
      }
      emit(GetPostsSuccess());
    }).catchError((error) {
      emit(GetPostsError(error: error.toString()));
    });
  }

  void likePosts(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({'like': true}).then((value) {
      emit(LikePostsSuccess());
    }).catchError((error) {
      emit(LikePostsError(error: error.toString()));
    });
  }
}
