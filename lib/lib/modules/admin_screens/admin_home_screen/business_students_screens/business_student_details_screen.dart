import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/shared/components/components.dart';

import 'business_student_book_screen.dart';

class BusinessStudentDetailsScreen extends StatelessWidget {
  const BusinessStudentDetailsScreen({Key? key, required this.BusinessStudentId}) : super(key: key);
  final int BusinessStudentId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppCubit.get(context).businessStudentsModel![BusinessStudentId].name!
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            <Widget>
            [
              // الصورة
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
                            AppCubit.get(context).businessStudentsModel![BusinessStudentId].image!
                        ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              //name
              Row(
                children: [
                  Text('Name:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.015,),
                  Expanded(
                    child: Text(
                      AppCubit.get(context).businessStudentsModel![BusinessStudentId].name!
                      ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,),
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

              //id
              Row(
                children: [
                  Text('ID:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.015,),
                  Expanded(
                    child: Text(
                      AppCubit.get(context).businessStudentsModel![BusinessStudentId].email!.split('@').first
                      ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,),
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

              //number of books
              Row(
                children: [
                  Text('No. of books:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.015,),
                  Expanded(
                    child: Text(
                      '${AppCubit.get(context).businessStudentsModel![BusinessStudentId].books!.length}'
                      ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,),
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

              //Acc created in
              Row(
                children: [
                  Text('Acc created in:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.015,),
                  Expanded(
                    child: Text(
                      '${AppCubit.get(context).businessStudentsModel![BusinessStudentId].createdAt!.split('T').first}'
                      ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,),
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

              //Acc updated in
              Row(
                children: [
                  Text('Last updated in:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.015,),
                  Expanded(
                    child: Text(
                      '${AppCubit.get(context).businessStudentsModel![BusinessStudentId].updatedAt!.split('T').first}'
                      ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,),
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

              //button student's books
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: defaultButton(
                  function: ()
                  {
                    debugPrint('${AppCubit.get(context).businessStudentsModel![BusinessStudentId].books!.length}');
                    navigateTo(context, BusinessStudentBookScreen(
                      BusinessStudentBooksId:BusinessStudentId,
                    ),
                    );
                  },
                  text: 'student books',
                  context: context,
                  height: size.height * 0.08,
                  width: size.width,
                ),
              ),
              SizedBox(height: size.height * 0.01,),

              //text button delete user acc
              Center(
                child: defaultTextButton(
                    onPressed: ()
                    {
                      AppCubit.get(context).indexStudent= BusinessStudentId;
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeleteStudentAccountAlertDialog(
                                title: 'Delete student account',
                                description: 'Are you sure?',
                                //StudentIDToDelete: StudentId,
                                ),
                        );
                    },
                    text: 'Delete student account',
                    color: Colors.red,
                    fontSize: 12,
                ),
                // TextButton(onPressed: ()
                // {
                //   AppCubit.get(context).indexStudent= StudentId;
                //   showDialog(
                //       context: context,
                //       builder: (context) =>
                //           DeleteStudentAccountAlertDialog(
                //           title: 'Delete student account',
                //           description: 'Are you sure?',
                //           //StudentIDToDelete: StudentId,
                //           ),
                //   );
                // },
                //   child: Text('Delete student account',
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.red,
                //     ),
                // ),
                // ),
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
    //required this.StudentIDToDelete,
  }) : super(key: key);

  final String title, description;
  //final int? StudentIDToDelete;

  @override
  _DeleteStudentAccountAlertDialogState createState() => _DeleteStudentAccountAlertDialogState();
}

class _DeleteStudentAccountAlertDialogState extends State<DeleteStudentAccountAlertDialog> {

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
                AppCubit.get(context).deleteStudentAccount();
                Navigator.pop(context);
                showToast(
                    message: 'Account deleted successfully',
                    state: ToastStates.SUCCESS );
                Navigator.pop(context);
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


