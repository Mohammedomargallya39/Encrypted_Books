import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/cubit/cubit.dart';

import '../admin_drawer.dart';
import '../students_departments.dart';
import 'eng_student_book_screen.dart';

class EngStudentBookPDFScreen extends StatelessWidget {
  EngStudentBookPDFScreen({Key? key,required this.EngStudentBookId, required this.EngStudentID}) : super(key: key);
   final int EngStudentBookId;
   final int EngStudentID;
   bool night = true;
   bool light = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).engStudentsModel![EngStudentID].books![EngStudentBookId].pdf != null,
          builder:(context) =>  Scaffold(
            floatingActionButton: Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 0,
                  child: IconButton(icon: Icon(Icons.delete_forever), onPressed: ()
                  {
                    AppCubit.get(context).EngIndexRemoveBookStudent= EngStudentBookId;
                    AppCubit.get(context).EngIndexRemoveStudentBook= EngStudentID;
                    showDialog(
                      context: context,
                      builder: (context) => DeleteStudentBooksAlertDialog(
                        title: 'Delete This Book',
                        description: 'Are you sure?',
                        //StudentIDToDelete: StudentId,
                      ),
                    );
                  },
                    iconSize: 30,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 30,
                  child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
                  {
                    navigateAndEnd(context, EngStudentBookScreen(EngStudentBooksId:EngStudentID));
                  }, iconSize: 23,
                  ),
                ),
              ],
            ),
            body:  PDF(
              nightMode: ThemeCubit.get(context).darkTheme? night : light ,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            ).cachedFromUrl(
              AppCubit.get(context).engStudentsModel![EngStudentID].books![EngStudentBookId].pdf!
              ,
              placeholder: (double progress) => Center(child: Text('$progress %')),
              errorWidget: (dynamic error) => Center(child: Text(error.toString())),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class DeleteStudentBooksAlertDialog extends StatefulWidget {
  const DeleteStudentBooksAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  _DeleteStudentBooksAlertDialogState createState() => _DeleteStudentBooksAlertDialogState();
}
class _DeleteStudentBooksAlertDialogState extends State<DeleteStudentBooksAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.height * 0.015),
          Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Text("${widget.description}",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: size.height * 0.015),
          Divider(
            height: size.height * 0.00222,
          ),
          Container(
            width: size.width,
            height: size.height * 0.05,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: ()
              {
                print(AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexRemoveStudentBook!].books![AppCubit.get(context).EngIndexRemoveBookStudent!].sId!);
                print(AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexRemoveStudentBook!].sId);
                print(token);
                AppCubit.get(context).removeBookFromStudent(
                    bookId:AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexRemoveStudentBook!].books![AppCubit.get(context).EngIndexRemoveBookStudent!].sId!,
                    studentId:AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexRemoveStudentBook!].sId,
                );
                showToast(
                    message: 'Book deleted successfully',
                    state: ToastStates.SUCCESS );
                navigateAndEnd(context,StudentsDepartmentsScreen());
              },
              child: Center(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 16.0,
                    color:Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: size.height * 0.00222,
          ),
          Container(
            width: size.width,
            height: size.height * 0.05,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}