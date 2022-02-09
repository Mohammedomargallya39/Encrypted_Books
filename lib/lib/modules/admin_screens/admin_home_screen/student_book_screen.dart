import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/shared/components/components.dart';

class StudentBookScreen extends StatelessWidget {
  const StudentBookScreen({Key? key, required this.studentBooksId}) : super(key: key);
  final int studentBooksId;

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.studentsModelWithOutAdmin![studentBooksId].books != null,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Student books'),

                actions: [
                  IconButton(
                    onPressed: ()
                    {
                      showModalBottomSheet(
                          context: context,
                          builder: (context)
                          {
                            return Scaffold(
                              appBar: AppBar(title: const Text('Add books'),),
                              body: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context,index) => addBooksForStudentsItem(
                                    AdminBooksDetails(
                                        name: cubit.adminBooksModel!.books![index].name,
                                        cover: cubit.adminBooksModel!.books![index].cover,
                                    ) , context),
                                separatorBuilder:(context,index)=> Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.0,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                ),
                                itemCount: cubit.adminBooksModel!.books!.length,
                              ),
                            );
                          }
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index) => InkWell(child:studentBooks(
                    StudentBookId(
                      name: AppCubit.get(context).studentsModelWithOutAdmin![studentBooksId].books![index].bookId!.name,
                      cover: AppCubit.get(context).studentsModelWithOutAdmin![studentBooksId].books![index].bookId!.cover,
                    ), context),
                    // onTap: ()
                    // {
                    //   navigateTo(context, UserPDFBooksScreen(
                    //     bookId : index,
                    //   ));
                    // },
                  ),
                  separatorBuilder:(context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  itemCount: cubit.studentsModelWithOutAdmin![studentBooksId].books!.length),
            ),
            fallback:(context) => Scaffold(
              appBar: AppBar(title: Text('Your Books'
              ),
              ),
              body: Center(
                child: Text('Student Does not have any books yet.',
                  style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22 ,
                  ),
                ),
              ),
            ),
          );
        },
      );
  }

  Widget studentBooks(StudentBookId studentBookId , context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
      child: Center(
        child: Column(
          children: [
             SizedBox(height: size.height * 0.005),
            Image(
              image: NetworkImage(
                  '${studentBookId.cover}'
              ),
              width: size.width,
              height: size.height * 0.22,
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              '${studentBookId.name}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            defaultTextButton(
              onPressed: ()
              {
                showDialog(
                          context: context,
                          builder: (context) =>
                              DeleteStudentBooksAlertDialog(
                                title: 'Delete student book',
                                description: 'Are you sure?',
                              ),
                        );
              },
              text: 'Remove this book',
              color: Colors.red,
              fontSize: 12,
            ),
            // TextButton(
            //   onPressed: ()
            //   {
            //     showDialog(
            //       context: context,
            //       builder: (context) =>
            //           DeleteStudentBooksAlertDialog(
            //             title: 'Delete student book',
            //             description: 'Are you sure?',
            //           ),
            //     );
            //   },
            //   child: Text('Remove this book',
            //     style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.red
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget addBooksForStudentsItem(AdminBooksDetails books, context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Column(
        children: [
           SizedBox(height: size.height * 0.015),
          Column(
            children:  [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(
                      books.cover!
                  ),
                  width: size.width,
                  height: size.height *0.15,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                books.name!
                ,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: ()
      {
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



