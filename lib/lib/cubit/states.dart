import 'package:social/lib/models/login_model.dart';

abstract class AppStates {}
class EncryptionAppInitialState extends  AppStates {}

class EncryptionLoadingUserDataState extends AppStates{}
class EncryptionSuccessUserDataState extends AppStates
{
  final UserData userData ;
  EncryptionSuccessUserDataState(this.userData);
}
class EncryptionErrorUserDataState extends AppStates{}


class EncryptionLoadingUpdateUserDataState extends AppStates{}
class EncryptionSuccessUpdateUserDataState extends AppStates
{
  final UserData userData ;
  EncryptionSuccessUpdateUserDataState(this.userData);
}
class EncryptionErrorUpdateUserDataState extends AppStates{}


class EncryptionSelectProfileImageState extends AppStates{}

