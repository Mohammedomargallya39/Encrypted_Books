import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/modules/login_screens/cubit/states.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class UserLoginCubit extends Cubit<UserLoginStates> {
  UserLoginCubit() : super(UserLoginInitialState());

  static UserLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  UserData? loginModel;

  void userLogin({required String email, required String password}) {
    print('-------------------------UserLogin--------------------');
    emit(UserLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      // if (value!.data != null) {
      //   print(value.data.toString());
      //
      // }
      print(value!.data['token']);
      loginModel = UserData.fromJson(value.data);
      print(loginModel!.token);
      print('-------------------------UserLogin-------------------- success');
      emit(UserLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('-------------------------UserLogin-------------------- error');
      print(error.toString());
      emit((UserLoginErrorState(error.toString())));
    });
  }



  void changeSuffix() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangeLoginSuffixState());
  }
}
