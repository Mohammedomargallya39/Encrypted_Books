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

class EngBooksCanAddedForStudentPdfScreen extends StatelessWidget {
  final int EngStudentIndexId;
  final int EngStudentBookIndexId;
  bool night = true;
  bool light = false;
  EngBooksCanAddedForStudentPdfScreen({Key? key, required this.EngStudentIndexId, required this.EngStudentBookIndexId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).adminBooksModel!.books![EngStudentBookIndexId].pdf != null,
          builder:(context) =>  Scaffold(
            appBar: AppBar(
              title:Text(
                  AppCubit.get(context).adminBooksModel!.books![EngStudentBookIndexId].name!
              ),
              actions: [
                InkWell(
                  child: IconButton(
                    color: Colors.white,
                    onPressed: ()
                    {
                      // AppCubit.get(context).indexBook= StudentBookId;
                      // print( AppCubit.get(context).studentsModelWithOutAdmin![StudentID].books![StudentBookId].bookId!.sId!);
                      // print(AppCubit.get(context).studentsModelWithOutAdmin![StudentID].sId);
                      // print(token);
                      //
                      // AppCubit.get(context).removeBookFromStudent(
                      //   bookId: AppCubit.get(context).studentsModelWithOutAdmin![StudentID].books![StudentBookId].bookId!.sId!,
                      //   studentId: AppCubit.get(context).studentsModelWithOutAdmin![StudentID].sId,
                      //);
                      // AppCubit.get(context).indexBookStudent= StudentBookId;
                      // AppCubit.get(context).indexStudentBook= StudentIndexId;
                      AppCubit.get(context).EngIndexAddedStudentBook= EngStudentIndexId;
                      AppCubit.get(context).EngIndexAddedBookStudent= EngStudentBookIndexId;
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AddStudentBooksAlertDialog(
                          title: 'Add This Book',
                          description: 'Are you sure?',
                          //StudentIDToDelete: StudentId,
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
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
              AppCubit.get(context).adminBooksModel!.books![EngStudentBookIndexId].pdf!
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



class AddStudentBooksAlertDialog extends StatefulWidget {
  const AddStudentBooksAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  _AddStudentBooksAlertDialogState createState() => _AddStudentBooksAlertDialogState();
}
class _AddStudentBooksAlertDialogState extends State<AddStudentBooksAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      //backgroundColor: Color(0xffffffff),
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
                // print(AppCubit.get(context).studentsModelWithOutAdmin![AppCubit.get(context).indexStudentBook!].books![AppCubit.get(context).indexBookStudent!].bookId!.sId!);
                // print(AppCubit.get(context).studentsModelWithOutAdmin![AppCubit.get(context).indexStudentBook!].sId);
                AppCubit.get(context).addBookToStudent(
                    bookId: AppCubit.get(context).adminBooksModel!.books![AppCubit.get(context).EngIndexAddedBookStudent!].sId!,
                    studentId: AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexAddedStudentBook!].sId,
                );
                print(token);
                print(AppCubit.get(context).adminBooksModel!.books![AppCubit.get(context).EngIndexAddedBookStudent!].sId!);
                print(AppCubit.get(context).engStudentsModel![AppCubit.get(context).EngIndexAddedStudentBook!].sId);
                Navigator.pop(context);
                showToast(
                    message: 'Book deleted successfully',
                    state: ToastStates.SUCCESS );
                Navigator.pop(context);
                //navigateAndEnd(context, AdminHomeScreen(),);
                //محتاج يتعدل
                //Restart.restartApp();

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

