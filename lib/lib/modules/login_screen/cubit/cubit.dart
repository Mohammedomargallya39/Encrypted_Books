import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/modules/login_screen/cubit/states.dart';


class EncryptionLoginCubit extends Cubit<EncryptionStates>
{
  EncryptionLoginCubit() : super(EncryptionLoginInitialState());

  static EncryptionLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;
  EncryptionLoginModel? loginModel;


  void userLogin({required String email, required String password})
  {

    emit(EncryptionLoginLoadingState());

  }


  void changeSuffix()
  {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(EncryptionChangeLoginSuffixState());
  }
}


