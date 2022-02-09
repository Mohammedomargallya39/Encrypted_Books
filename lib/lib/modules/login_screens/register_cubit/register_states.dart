abstract class UserRegisterStates {}
class UserRegisterInitialState extends UserRegisterStates{}
class UserRegisterLoadingState extends UserRegisterStates{}
class UserRegisterSuccessState extends UserRegisterStates{}
class UserRegisterErrorState extends UserRegisterStates {
  final String error ;
  UserRegisterErrorState(this.error);
}
class UserChangeRegisterSuffixState extends UserRegisterStates{}
class SelectedDepartmentState  extends UserRegisterStates{}
class SelectDepartmentInitialState  extends UserRegisterStates{}
class SelectDepartmentLoadingState extends UserRegisterStates{}
class SelectDepartmentSuccessState extends UserRegisterStates{}
class ChangeRadioButton extends UserRegisterStates{}
