import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(EncryptionAppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  UserData? userModel;
  void getUserData() {
    emit(EncryptionLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.name);
      emit(EncryptionSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUserDataState());
    });
  }

  void updateUserData({required String name, required String phone,}) {
    emit(EncryptionLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        name : 'name',
        phone : 'phone',
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

  void updateUserImage({File? image,}) async{
    emit(EncryptionLoadingUpdateUserDataState());
    DioHelper.patchData(
      url: UPDATE_PIC_PROFILE,
      token: token,
      data: {
        if (image != null)
        'pic' : await MultipartFile.fromFile(
          image.path,
          filename: Uri.file(image.path).pathSegments.last,
        ),
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


  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  void selectImage() async
   {
    _picker.pickImage(source: ImageSource.gallery).then((value)
    {
      imageFile = File(value!.path);
    });
    emit(EncryptionSelectProfileImageState());
  }

}

