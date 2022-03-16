import 'package:social/lib/models/login_model.dart';

abstract class LoginStates {}

class UserLoginInitialState extends LoginStates {}
class UserLoginLoadingState extends LoginStates {}
class UserLoginSuccessState extends LoginStates {
  final UserData loginModel;
  UserLoginSuccessState(this.loginModel);
}
class UserLoginErrorState extends LoginStates {
  final String error;
  UserLoginErrorState(this.error);
}
class AdminLoginLoadingState extends LoginStates {}
class AdminLoginSuccessState extends LoginStates {
  final UserData loginModel;
  AdminLoginSuccessState(this.loginModel);
}
class AdminLoginErrorState extends LoginStates {
  final String error;
  AdminLoginErrorState(this.error);
}
class UserChangeLoginSuffixState extends LoginStates {}