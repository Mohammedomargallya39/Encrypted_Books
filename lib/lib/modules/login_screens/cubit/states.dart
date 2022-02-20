import 'package:social/lib/models/login_model.dart';

abstract class UserLoginStates {}

class UserLoginInitialState extends UserLoginStates {}
class UserLoginLoadingState extends UserLoginStates {}
class UserLoginSuccessState extends UserLoginStates {
  final UserData loginModel;
  UserLoginSuccessState(this.loginModel);
}
class UserLoginErrorState extends UserLoginStates {
  final String error;
  UserLoginErrorState(this.error);
}
class UserChangeLoginSuffixState extends UserLoginStates {}