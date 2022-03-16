import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/models/register_model.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_states.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class UserRegisterCubit extends Cubit<RegisterStates> {
  UserRegisterCubit() : super(UserRegisterInitialState());
  static UserRegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  UserData? registerModel;
  int currentIndex = 0;
  bool isEng = false;
  bool isMan = false;
  bool isCom = false;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required bool isMan,
    required bool isEng,
    required bool isCom,
  })
  {
    print('--------userRegister-----------');
    emit(UserRegisterLoadingState());
    DioHelper.postUserData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'isManagmentsection': isMan,
        'isEnginneringsection': isEng,
        'isComputerSciencesection': isCom,
      },
    ).then((value) {
      print('--------userRegister----------- Success ${value.data.toString()}');
      printLongString(value.data.toString());
      emit(UserRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('--------userRegister----------- Error ${error.toString()}');
      emit(UserRegisterErrorState(error.toString()));
    });
  }

  void adminRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required bool isMan,
    required bool isEng,
    required bool isCom,
  })
  {
    print('--------AdminRegister-----------');
    emit(AdminRegisterLoadingState());
    DioHelper.postAdminData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'isManagmentsection': isMan,
        'isEnginneringsection': isEng,
        'isComputerSciencesection': isCom,
      },
    ).then((value) {
      print('--------AdminRegister----------- Success ${value.data.toString()}');
      printLongString(value.data.toString());
      emit(AdminRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('--------AdminRegister----------- Error ${error.toString()}');
      emit(AdminRegisterErrorState(error.toString()));
    });
  }

//   late UserData makeUserAdmins;
//   void makeAdmin({
//   required String? studentId
// })
//   {
//     print('--------makeAdmin-----------');
//     emit(AdminLoadingState());
//     DioHelper.postAdminData(
//       url: '$REGISTER/${studentId}',
//       data:
//       {
//         'isAdmin':true,
//         'isComputerSciencesection':false,
//         'isEnginneringsection':false,
//         'isManagmentsection':false,
//       },
//     ).then((value) {
//       print('--------makeAdmin----------- Success ${value.data.toString()}');
//       printLongString(value.data.toString());
//       emit(AdminSuccessState(makeUserAdmins));
//     }).catchError((error) {
//       print(error.toString());
//       print('--------makeAdmin----------- Error ${error.toString()}');
//       emit(AdminErrorState(error.toString()));
//     });
//   }

  void changeSuffix() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangeRegisterSuffixState());
  }
  UserRegisterModel? selectedDepartment;
  void selectDepartment(UserRegisterModel model) {
    selectedDepartment = model;
    emit(SelectedDepartmentState());
  }
  void changeRadioButton({required int? index}) {
    currentIndex = index!;
    if (index == 1) {
      isEng = true;
      isCom = false;
      isMan = false;
    } else if (index == 2) {
      isEng = false;
      isCom = true;
      isMan = false;
    }else if(index == 3){
      isEng = false;
      isCom = false;
      isMan = true;
    }
    emit(ChangeRadioButton());
  }
}