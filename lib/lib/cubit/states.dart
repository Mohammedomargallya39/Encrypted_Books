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


