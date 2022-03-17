import 'package:social/lib/models/login_model.dart';

abstract class RegisterStates {}
class UserRegisterInitialState extends RegisterStates{}
class UserRegisterLoadingState extends RegisterStates{}
class UserRegisterSuccessState extends RegisterStates{}
class UserRegisterErrorState extends RegisterStates {
  final String error ;
  UserRegisterErrorState(this.error);
}
class AdminRegisterLoadingState extends RegisterStates{}
class AdminRegisterSuccessState extends RegisterStates{}
class AdminRegisterErrorState extends RegisterStates {
  final String error ;
  AdminRegisterErrorState(this.error);
}

class UserChangeRegisterSuffixState extends RegisterStates{}
class SelectedDepartmentState  extends RegisterStates{}
class SelectDepartmentInitialState  extends RegisterStates{}
class SelectDepartmentLoadingState extends RegisterStates{}
class SelectDepartmentSuccessState extends RegisterStates{}
class ChangeRadioButton extends RegisterStates{}
