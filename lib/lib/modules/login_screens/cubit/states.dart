import 'package:social/lib/models/login_model.dart';


//                    user
abstract class UserLoginStates {}
class UserLoginInitialState      extends UserLoginStates{}
class UserLoginLoadingState      extends UserLoginStates{}
class UserLoginSuccessState      extends UserLoginStates{
  final UserLoginModel userLoginModel;
  UserLoginSuccessState(this.userLoginModel);

}
class UserLoginErrorState        extends UserLoginStates{}
class UserChangeLoginSuffixState extends UserLoginStates{}


//                    admin


abstract class AdminLoginStates {}
class AdminLoginInitialState      extends AdminLoginStates{}
class AdminLoginLoadingState      extends AdminLoginStates{}
class AdminLoginSuccessState      extends AdminLoginStates{
  final AdminLoginModel adminLoginModel;
  AdminLoginSuccessState(this.adminLoginModel);

}
class AdminLoginErrorState        extends AdminLoginStates{}
class AdminChangeLoginSuffixState extends AdminLoginStates{}