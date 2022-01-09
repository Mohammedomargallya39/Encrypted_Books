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
    print('id done');
    name = json["name"] ?? '';
    print('name done');
    email = json["email"] ?? '';
    print('email done');
    phone = json["phone"] ?? '';
    print('phone done');
    isAdmin = json["isAdmin"] ?? false;
    print('is admin done');
    isMan = json["isManagmentsection"] ?? false;
    print('ismanage done');
    isEng = json["isEnginneringsection"] ?? false;
    print('is eng  done');
    isCom = json["isComputerSciencesection"] ?? false;
    print('is computer  done');
    image = json["pic"] ?? '';
    print('pic done');
    token = json["token"] ?? '';
    print('token done');
  }
}
