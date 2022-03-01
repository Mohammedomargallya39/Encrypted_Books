import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/cs_students_screens/cs_student_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';

import '../admin_drawer.dart';
import '../students_departments.dart';
import 'cs_students_screen.dart';

class CsStudentDetailsScreen extends StatelessWidget {
  const CsStudentDetailsScreen({Key? key, required this.StudentId}) : super(key: key);
  final int StudentId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
        ,onPressed: ()
        {
          navigateAndEnd(context, CsStudentsScreen());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/main_top.png',
                  width: size.width * 0.35,),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('assets/images/login_bottom.png',
                  width: size.width * 0.4,),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
                  child: BlocConsumer<ThemeCubit,ThemeStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        <Widget>
                        [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 33, 0, 0),
                            child: Center(
                              child: GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  width:  size.width * 0.5,
                                  height: size.height * 0.21,
                                  decoration:  BoxDecoration(shape: BoxShape.circle,
                                    image: DecorationImage(image:
                                    NetworkImage(
                                        AppCubit.get(context).csStudentsModel![StudentId].image!
                                    ),
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02,),
                          Row(
                            children: [
                              Text('Name:',
                                style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.015,),
                              Expanded(
                                child: Text(
                                  AppCubit.get(context).csStudentsModel![StudentId].name!
                                  ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size.width * 0.0475,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom:  BorderSide(color: Colors.grey , width: size.width * 0.003),),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            children: [
                              Text('ID:',
                                style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.015,),
                              Expanded(
                                child: Text(
                                  AppCubit.get(context).csStudentsModel![StudentId].email!.split('@').first
                                  ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size.width * 0.0475,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom:  BorderSide(color: Colors.grey , width: size.width * 0.003),),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            children: [
                              Text('No. of books:',
                                style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.015,),
                              Expanded(
                                child: Text(
                                  '${AppCubit.get(context).csStudentsModel![StudentId].books!.length}'
                                  ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size.width * 0.0475,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom:  BorderSide(color: Colors.grey , width: size.width * 0.003),),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            children: [
                              Text('Acc created in:',
                                style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.015,),
                              Expanded(
                                child: Text(
                                  '${AppCubit.get(context).csStudentsModel![StudentId].createdAt!.split('T').first}'
                                  ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size.width * 0.0475,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom:  BorderSide(color: Colors.grey , width: size.width * 0.003),),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            children: [
                              Text('Last updated in:',
                                style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.015,),
                              Expanded(
                                child: Text(
                                  '${AppCubit.get(context).csStudentsModel![StudentId].updatedAt!.split('T').first}'
                                  ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size.width * 0.0475,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom:  BorderSide(color: Colors.grey , width: size.width * 0.003),),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02,),
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: defaultButton(
                              function: ()
                              {
                                debugPrint('${AppCubit.get(context).csStudentsModel![StudentId].books!.length}');
                                navigateTo(context, CsStudentBookScreen(CsStudentBooksId: StudentId,));
                              },
                              text: 'student books',
                              fontSize: size.width * 0.035,
                              context: context,
                              height: size.height * 0.1,
                              width: size.width,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Center(
                            child: defaultTextButton(
                              onPressed: ()
                              {
                                AppCubit.get(context).indexStudent= StudentId;
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DeleteStudentAccountAlertDialog(
                                        title: 'Delete student account',
                                        description: 'Are you sure?',
                                      ),
                                );
                              },
                              text: 'Delete student account',
                              color: Colors.red,
                              fontSize: size.width * 0.03,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteStudentAccountAlertDialog extends StatefulWidget {
  const DeleteStudentAccountAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;
  @override
  _DeleteStudentAccountAlertDialogState createState() => _DeleteStudentAccountAlertDialogState();
}

class _DeleteStudentAccountAlertDialogState extends State<DeleteStudentAccountAlertDialog> {

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
                AppCubit.get(context).deleteCsStudentAccount();
                showToast(
                    message: 'Account deleted successfully',
                    state: ToastStates.SUCCESS );
                navigateAndEnd(context, StudentsDepartmentsScreen());
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