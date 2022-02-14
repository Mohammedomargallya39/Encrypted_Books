import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/login_model.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/models/user_books_model.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/network/end_points.dart';
import 'package:social/lib/shared/network/shared/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(EncryptionAppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  //user data
  UserData? userModel ;
  void getUserData() async {
    emit(EncryptionLoadingUserDataState());
    await DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.name);
      print(userModel!.id);
      print(userModel!.image);
      getUserBooks();
      getStudents();
      emit(EncryptionSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUserDataState());
    });
  }
  void updateUserData({
    required String name,
    required String phone,
    required String password,
  })
  {
    emit(EncryptionLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.name);
      emit(EncryptionSuccessUpdateUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUpdateUserDataState());
    });
  }
  //update user image
  void updateUserImage({
    File? pic,
  }) async {
    emit(EncryptionLoadingUpdateUserImageState());
    DioHelper.patchData(
      url: UPDATE_PIC_PROFILE,
      token: token,
      data: FormData.fromMap({
        if (pic != null)
          'pic': await MultipartFile.fromFile(
            pic.path,
            filename: Uri
                .file(pic.path)
                .pathSegments
                .last,
          ),
      }),
      // data: {
      //   if (pic != null)
      //     'pic' : [await MultipartFile.fromFile(
      //       pic.path,
      //       filename: Uri.file(pic.path).pathSegments.last,
      //     ),]
      // },
    ).then((value) {
      userModel = UserData.fromJson(value!.data);
      print(userModel!.image);
      emit(EncryptionSuccessUpdateUserImageState(userModel!));
      print('********************Image success updated ***********************');
    }).catchError((error) {
      print(error.toString());
      emit(EncryptionErrorUpdateUserImageState());
    });
  }
  //select image from gallery
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  void selectImage() async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = File(value!.path);
      emit(EncryptionSelectProfileImageState());
    });
  }
  //user books
  HomeModel? homeModel;
  void getUserBooks() {
    emit(EncryptionLoadingGetUserBooksState());
    print('------------------get users books test-------------------');
    print(userModel!.id);
    DioHelper.getData(
      url: '${GET_USER_BOOKS}${userModel!.id}',
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      print(homeModel!.toString());
      print('----------------------success--------------------');
      emit(EncryptionSuccessGetUserBooksState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      print('-------------------------error--------------------');
      emit(EncryptionErrorGetUserBooksState());
    });
  }
  List<StudentsModel>? studentsModel = [];
  List<StudentsModel>? csStudentsModel = [];
  List<StudentsModel>? businessStudentsModel = [];
  List<StudentsModel>? engStudentsModel = [];
  List<StudentsModel>? adminsModel = [];
  //user with out admins
  void getCsStudents() {
    csStudentsModel =
        studentsModel!.where((element) =>
        // element.isEnginneringsection == true ||
        //     element.isManagmentsection == true ||
            element.isComputerSciencesection == true
            //    && element.books!.where((element) =>
            // element.bookId != null
            // ) != 'null',
        ).toList();
  }
  void getBusinessStudents() {
    businessStudentsModel =
        studentsModel!.where((element) =>
        // element.isEnginneringsection == true ||
             element.isManagmentsection == true
        //element.isComputerSciencesection == true
        ).toList();
  }
  void getEngStudents() {
    engStudentsModel =
        studentsModel!.where((element) =>
         element.isEnginneringsection == true
        //     element.isManagmentsection == true ||
       // element.isComputerSciencesection == true
        ).toList();
  }
  void getAdmins() {
    adminsModel =
        studentsModel!.where((element) =>
            element.isAdmin == true
          // element.isEnginneringsection == true
          //     element.isManagmentsection == true ||
          // element.isComputerSciencesection == true
        ).toList();
  }

  //all users
  void getStudents() {
    emit(EncryptionLoadingGetStudentsState());
    print('------------------test Loading get students-------------------');
    DioHelper.getData(
      url: GET_STUDENTS,
      token: token,
    ).then((value) {
      print('---test before enter model---');
      // studentsModel = StudentsModel.fromJson(value!.data);
      if (value != null) {
        value.data.forEach((element) {
          studentsModel!.add(StudentsModel.fromJson(element));
        });
      }
      getCsStudents();
      getBusinessStudents();
      getEngStudents();
      getAdmins();
      print(csStudentsModel!.length);
      print(businessStudentsModel!.length);
      print(engStudentsModel!.length);
      print(adminsModel!.length);

      // print(studentsModel!.toString());
      print(
          '----------------------getStudentSuccess-------------------- ${value!.data}');
      emit(EncryptionSuccessGetStudentsState(studentsModel!));
    }).catchError((error) {
      debugPrint(
          '-------------------------error-------------------- ${error.toString()}');
      emit(EncryptionErrorGetStudentsState());
    });
  }
  AdminBooksModel? adminBooksModel;
  //all books
  void getAdminBooks() {
    emit(EncryptionLoadingGetAdminBooksState());
    print('------------------get admin books test-------------------');
    DioHelper.getData(
      url: GET_Books,
      token: token,
      query:
      {
        'category':'computerscience',
      },
    ).then((value) {
      adminBooksModel = AdminBooksModel.fromJson(value!.data);
      print(adminBooksModel!.toString());
      print(
          '----------------------success get admin books--------------------');
      emit(EncryptionSuccessGetAdminBooksState(adminBooksModel!));
    }).catchError((error) {
      print(error.toString());
      print(
          '-------------------------error get admin books--------------------');
      emit(EncryptionErrorGetAdminBooksState());
    });
  }
  int? indexStudent;
  //delete student acc
  void deleteStudentAccount() {
    emit(EncryptionLoadingDeleteStudentAccountState());
    print(
        '----------loading delete account test----------- ${csStudentsModel![indexStudent!].name}');
    print(
        '----------loading delete account test----------- ${csStudentsModel![indexStudent!].sId}');
    print('----------loading delete account test----------- ${indexStudent}');
    DioHelper.deleteData(
      //url: '',
      url: '${DELETE_STUDENT_ACCOUNT}${csStudentsModel![indexStudent!].sId}',
      token: token,
    ).then((value) {
      getCsStudents();
      print(getCsStudents);
      print('----------Success delete account test-----------${value!.data}');
      emit(EncryptionSuccessDeleteStudentAccountState());
    }).catchError((error) {
      print(error.toString());
      print('----------error delete account test-----------');
      emit(EncryptionErrorDeleteStudentAccountState());
    });
  }
  int? indexBook;
  //delete book
  void deleteBooks() {
    emit(EncryptionLoadingDeleteBookState());
    print(
        '----------loading delete book test----------- ${adminBooksModel!.books![indexBook!].name}');
    print(
        '----------loading delete book test----------- ${adminBooksModel!.books![indexBook!].sId}');
    print('----------loading delete book test----------- ${indexBook}');
    DioHelper.deleteData(
      //url: '',
      url: '${DELETE_BOOK}${adminBooksModel!.books![indexBook!].sId}',
      token: token,
    ).then((value) {
      print('----------Success delete book test-----------${value!.data}');
      emit(EncryptionSuccessDeleteBookState());
    }).catchError((error) {
      print(error.toString());
      print('----------error delete book test-----------');
      emit(EncryptionErrorDeleteBookState());
    });
  }
  //upload book
  void uploadBookData({
    required String name,
    //required String category,
    required String description,
    required File cover,
    required FilePickerResult pdf,
  }) async
  {
    //WidgetsFlutterBinding.ensureInitialized();
    print('--------loading upload books-----------');
    emit(AdminUploadBooksLoadingState());
    print("*******************loading*********************${cover}");
    print("*********************loading*******************${pdf}");
    await DioHelper.postDataWithToken(
        url: UPLOAD_BOOK,
        token: token,
        data: FormData.fromMap({
            'name': name,
            'category': 'computerscience',
            'description': description,
            'cover' : await MultipartFile.fromFile(
            cover.path,
            filename: Uri
                .file(cover.path)
                .pathSegments
                .last,
          ),
            'pdf': await MultipartFile.fromFile(
            '${pdf.files.first.path}',
            filename: Uri
                .file('${pdf.files.first.path}')
                .pathSegments
                .last,
          ),
        }),
        ).then((value){
      print("*********************success*******************${cover}");
      print("***********************success*****************${pdf}");
      print('--------success upload books-----------');
      //print();
      emit(AdminUploadBooksSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('--------error upload books-----------');
      emit(AdminUploadBooksErrorState(error.toString()),
      );
      },
      );
  }

  //select cover from gallery
  final ImagePicker imagePicker = ImagePicker();
  File? coverFile;
  void selectCover() async {
    //WidgetsFlutterBinding.ensureInitialized();
    await imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      coverFile = File(value!.path);
      emit(EncryptionSelectBookCoverState());
    });
  }
  // select pdf
  FilePickerResult? pdf ;
  void selectPDF() async {
    //WidgetsFlutterBinding.ensureInitialized();
    pdf = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf',],
    );
    final file = pdf!.files.first;
    print('NAme: ${file.name}');
    print('NAme: ${file.size}');
    print('NAme: ${file.bytes}');
    print('NAme: ${file.extension}');
    print('NAme: ${file.path}');
    emit(EncryptionSelectBookPDFState());
  }


  //add book to student
  int? CsIndexAddedBookStudent;
  int? CsIndexAddedStudentBook;
  int? EngIndexAddedBookStudent;
  int? EngIndexAddedStudentBook;
  int? BusinessIndexAddedBookStudent;
  int? BusinessIndexAddedStudentBook;
  void addBookToStudent({
    required bookId,
    required studentId,

    })
  {
    emit(AdminAddBookToStudentLoadingState());
    print('------------------add books loading test-------------------');

    DioHelper.postDataWithToken(
      url: '${GET_USER_BOOKS}${studentId}/${ADD_BOOK_TO_STUDENT}',
      token: token,
      data: {
        'bookId' : bookId,
      }
    ).then((value) {
      print('----------------------add books success test--------------------');
      emit(AdminAddBookToStudentSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('-------------------------add books error test--------------------');
      emit(AdminAddBookToStudentErrorState(error.toString()));
    });
  }
  //remove book from student
  int? CsIndexRemoveBookStudent;
  int? CsIndexRemoveStudentBook;
  int? EngIndexRemoveBookStudent;
  int? EngIndexRemoveStudentBook;
  int? BusinessIndexRemoveBookStudent;
  int? BusinessIndexRemoveStudentBook;
  void removeBookFromStudent({
    required bookId,
    required studentId,

  })
  {
    emit(AdminRemoveBookFromStudentLoadingState());
    print('------------------remove books loading test-------------------');

    DioHelper.putData(
        url: '${GET_USER_BOOKS}${studentId}/${ADD_BOOK_TO_STUDENT}',
        token: token,
        data: {
          'bookId' : bookId,
        }
    ).then((value) {
      print('----------------------remove books success test--------------------');
      emit(AdminRemoveBookFromStudentSuccessState());
    }).catchError((error) {
      print(error.toString());
      print('-------------------------remove books error test--------------------');
      emit(AdminRemoveBookFromStudentErrorState(error.toString()));
    });
  }

  void csSearchBook()
  {

  }

  void SearchStudent()
  {

  }
}