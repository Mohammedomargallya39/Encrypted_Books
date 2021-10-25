import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/modules/login_screens/cubit/states.dart';

//                         'user login'
class UserLoginCubit extends Cubit<UserLoginStates>
{
  UserLoginCubit() : super(UserLoginInitialState());

  static UserLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;
  UserLoginModel? loginModel;


  void userLogin({required String email, required String password})
  {

    emit(UserLoginLoadingState());

  }


  void changeSuffix()
  {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangeLoginSuffixState());
  }
}


//                        'admin login'

class AdminLoginCubit extends Cubit<AdminLoginStates>
{
  AdminLoginCubit() : super(AdminLoginInitialState());

  static AdminLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;
  UserLoginModel? loginModel;


  void adminLogin({required String email, required String password})
  {

    emit(AdminLoginLoadingState());

  }


  void changeSuffix()
  {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AdminChangeLoginSuffixState());
  }
}

