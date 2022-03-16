import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/modules/login_screens/cubit/states.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class UserLoginCubit extends Cubit<LoginStates> {
  UserLoginCubit() : super(UserLoginInitialState());

  static UserLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  UserData? loginModel;
  void userLogin({required String email, required String password}) {
    print('-------------------------UserLogin--------------------');
    emit(UserLoginLoadingState());
    DioHelper.postUserData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data['token']);
      loginModel = UserData.fromJson(value.data);
      print(loginModel!.token);
      print(loginModel!.id);

      print('-------------------------UserLogin-------------------- success');
      emit(UserLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('-------------------------UserLogin-------------------- error');
      print(error.toString());
      emit((UserLoginErrorState(error.toString())));
    });
  }
  void adminLogin({required String email, required String password}) {
    print('-------------------------UserAdmin--------------------');
    emit(AdminLoginLoadingState());
    DioHelper.postAdminData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data['token']);
      loginModel = UserData.fromJson(value.data);
      print(loginModel!.token);
      print(loginModel!.id);

      print('-------------------------UserAdmin-------------------- success');
      emit(AdminLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('-------------------------UserAdmin-------------------- error');
      print(error.toString());
      emit((AdminLoginErrorState(error.toString())));
    });
  }
  void changeSuffix() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangeLoginSuffixState());
  }
}