import 'package:social/lib/models/login_model.dart';

abstract class EncryptionStates {}
class EncryptionLoginInitialState      extends EncryptionStates{}
class EncryptionLoginLoadingState      extends EncryptionStates{}
class EncryptionLoginSuccessState      extends EncryptionStates{
  final EncryptionLoginModel encryptionLoginModel;

  EncryptionLoginSuccessState(this.encryptionLoginModel);

}
class EncryptionLoginErrorState        extends EncryptionStates{}
class EncryptionChangeLoginSuffixState extends EncryptionStates{}