// import 'dart:io';
//
// class UpdateImageModel{
//   late bool status;
//   String? message;
//   File? image;
//   UpdateImageModel.fromJson(Map<String,dynamic> json){
//     message = json['message'];
//     image = (json['pic'] != null ? UpdateUserImage.fromJson(json['pic']) : null) as File?;
//   }
//
// }
//
// class UpdateUserImage {
//   File? image;
//   UpdateUserImage.fromJson(Map<String , dynamic> json)
//   {
//     image = 'pic' as File?;
//   }
// }

class UserData {
  late String id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late bool isAdmin;
  late bool isEng;
  late bool isMan;
  late bool isCom;
  late String token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["_id"] ?? '';
    print('id is $id');
    name = json["name"] ?? '';
    print('name is $name');
    email = json["email"] ?? '';
    print('email is $email');
    phone = json["phone"] ?? '';
    print('phone is $phone');
    isAdmin = json["isAdmin"] ?? false;
    print('is Admin $isAdmin');
    isMan = json["isManagmentsection"] ?? false;
    print('is Man $isMan');
    isEng = json["isEnginneringsection"] ?? false;
    print('is Eng $isEng');
    isCom = json["isComputerSciencesection"] ?? false;
    print('is com $isCom');
    image = json["pic"] ?? '';
    print('image is $image');
    token = json["token"] ?? '';
    print('token is $token');
  }
}
