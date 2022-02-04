import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/models/user_books_model.dart';

abstract class AppStates {}
class EncryptionAppInitialState extends  AppStates {}

// UserData
class EncryptionLoadingUserDataState extends AppStates{}
class EncryptionSuccessUserDataState extends AppStates
{
  final UserData userData ;
  EncryptionSuccessUserDataState(this.userData);
}
class EncryptionErrorUserDataState extends AppStates{}


// GetUserBooks
class EncryptionLoadingGetUserBooksState extends AppStates{}
class EncryptionSuccessGetUserBooksState extends AppStates
{
  final HomeModel homeModel ;
  EncryptionSuccessGetUserBooksState(this.homeModel);
}
class EncryptionErrorGetUserBooksState extends AppStates{}

// GetUserBooks
class EncryptionLoadingGetAdminBooksState extends AppStates{}
class EncryptionSuccessGetAdminBooksState extends AppStates
{
  final AdminBooksModel adminBooksModel ;
  EncryptionSuccessGetAdminBooksState(this.adminBooksModel);
}
class EncryptionErrorGetAdminBooksState extends AppStates{}

//Get Students
class EncryptionLoadingGetStudentsState extends AppStates{}
class EncryptionSuccessGetStudentsState extends AppStates
{
  final List<StudentsModel> studentsModel ;
  EncryptionSuccessGetStudentsState(this.studentsModel);
}
class EncryptionErrorGetStudentsState extends AppStates{}


// UpdateUserData
class EncryptionLoadingUpdateUserDataState extends AppStates{}
class EncryptionSuccessUpdateUserDataState extends AppStates
{
  final UserData userData ;
  EncryptionSuccessUpdateUserDataState(this.userData);
}
class EncryptionErrorUpdateUserDataState extends AppStates{}

// UpdateUserImage
class EncryptionLoadingUpdateUserImageState extends AppStates{}
class EncryptionSuccessUpdateUserImageState extends AppStates
{
  final UserData userData ;
  EncryptionSuccessUpdateUserImageState(this.userData);
}
class EncryptionErrorUpdateUserImageState extends AppStates{}

// Delete User Account
class EncryptionLoadingDeleteStudentAccountState extends AppStates{}
class EncryptionSuccessDeleteStudentAccountState extends AppStates {}
class EncryptionErrorDeleteStudentAccountState extends AppStates{}


// Delete Book
class EncryptionLoadingDeleteBookState extends AppStates{}
class EncryptionSuccessDeleteBookState extends AppStates {}
class EncryptionErrorDeleteBookState extends AppStates{}


// SelectProfileImage
class EncryptionSelectProfileImageState extends AppStates{}

