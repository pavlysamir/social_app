import 'dart:core';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? cover;
  String? bio;

  UserModel({this.name,this.email,this.phone,this.uId,this.image,this.cover,this.bio });

  UserModel.fromJson(Map<String ,dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image =json['image'];
    cover =json['cover'];
    bio =json['bio'];
  }

  Map<String ,dynamic> toMap(){
    return {
      'name' : name,
      'phone' : phone,
      'email' : email,
      'uId' : uId,
      'image' : image,
      'cover' : cover,
      'bio' : bio,

  };
}
}