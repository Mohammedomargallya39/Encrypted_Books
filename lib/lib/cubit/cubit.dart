import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/models/user_books_model.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(EncryptionAppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserData? userModel;
  void getUserData() async{
    emit(EncryptionLoadingUserDataState());
    await DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.name);
      print(userModel!.id);
      print(userModel!.image);

      getUserBooks(homeModel);
      getStudents();

      emit(EncryptionSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String phone,
    required String password,
  }) {
    emit(EncryptionLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.name);
      emit(EncryptionSuccessUpdateUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUpdateUserDataState());
    });
  }

  void updateUserImage({
    File? pic,
  }) async {
    emit(EncryptionLoadingUpdateUserImageState());
    DioHelper.patchData(
      url: UPDATE_PIC_PROFILE,
      token: token,
      data: FormData.fromMap({
        if (pic != null)
          'pic': await MultipartFile.fromFile(
            pic.path,
            filename: Uri.file(pic.path).pathSegments.last,
          ),
      }),
      // data: {
      //   if (pic != null)
      //     'pic' : [await MultipartFile.fromFile(
      //       pic.path,
      //       filename: Uri.file(pic.path).pathSegments.last,
      //     ),]
      // },
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.image);
      emit(EncryptionSuccessUpdateUserImageState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUpdateUserImageState());
    });
  }
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  void selectImage() async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = File(value!.path);
    });
    emit(EncryptionSelectProfileImageState());
  }

  HomeModel? homeModel;

  void getUserBooks(dynamic bookId) {
    emit(EncryptionLoadingGetUserBooksState());
    print('------------------get users books test-------------------');
    print(userModel!.id);
    DioHelper.getData(
      url: '${GET_USER_BOOKS}${userModel!.id}',
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      print(homeModel!.toString());
      print('----------------------success--------------------');
      emit(EncryptionSuccessGetUserBooksState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      print('-------------------------error--------------------');
      emit(EncryptionErrorGetUserBooksState());
    });
  }

  List<StudentsModel>? studentsModel =[];

  void getStudents() {
    emit(EncryptionLoadingGetStudentsState());
    print('------------------test Loading get students-------------------');
    DioHelper.getData(
      url: GET_STUDENTS,
      token: token,
    ).then((value) {
      print('---test before enter model---');
      // studentsModel = StudentsModel.fromJson(value!.data);
      if (value !=null)
      {
        value.data.forEach((element) {
          studentsModel!.add(StudentsModel.fromJson(element));
        });
      }
      // print(studentsModel!.toString());
      print('----------------------getStudentSuccess-------------------- ${value!.data}');
      emit(EncryptionSuccessGetStudentsState(studentsModel!));
    }).catchError((error) {
      debugPrint('-------------------------error-------------------- ${error.toString()}');
      emit(EncryptionErrorGetStudentsState());
    });
  }
}

