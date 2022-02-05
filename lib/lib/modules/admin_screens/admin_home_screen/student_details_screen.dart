import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_home_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/student_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({Key? key, required this.StudentId}) : super(key: key);
  final int StudentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppCubit.get(context).studentsModelWithOutAdmin![StudentId].name!
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                      width: 275,
                      height: 275,
                      decoration:  BoxDecoration(shape: BoxShape.circle,
                        image: DecorationImage(image:
                        NetworkImage(
                            AppCubit.get(context).studentsModelWithOutAdmin![StudentId].image!
                        ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 33.33,),
              //name
              Row(
                children: [
                  Text('Name:',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(
                    AppCubit.get(context).studentsModelWithOutAdmin![StudentId].name!
                    ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,),
                  ),
                ],
              ),
              const SizedBox(height: 17,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 17,),

              //id
              Row(
                children: [
                  Text('ID:',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(
                    AppCubit.get(context).studentsModelWithOutAdmin![StudentId].email!.split('@').first
                    ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,),
                  ),
                ],
              ),
              const SizedBox(height: 17,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 17,),

              //number of books
              Row(
                children: [
                  Text('No. of books:',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(
                    '${AppCubit.get(context).studentsModelWithOutAdmin![StudentId].numberofBooks}'
                    ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,),
                  ),
                ],
              ),
              const SizedBox(height: 17,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 17,),

              //Acc created in
              Row(
                children: [
                  Text('Acc created in:',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(
                    '${AppCubit.get(context).studentsModelWithOutAdmin![StudentId].createdAt}'
                    ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,),
                  ),
                ],
              ),
              const SizedBox(height: 17,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 17,),

              //Acc updated in
              Row(
                children: [
                  Text('Last updated in:',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(
                    '${AppCubit.get(context).studentsModelWithOutAdmin![StudentId].updatedAt}'
                    ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,),
                  ),
                ],
              ),
              const SizedBox(height: 17,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 33,),

              //button student's books
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55.55,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 17.5,
                    color: defaultColor,
                    onPressed: ()
                    {
                      debugPrint('${AppCubit.get(context).studentsModelWithOutAdmin![StudentId].books!.length}');
                      navigateTo(context, StudentBookScreen(studentBooksId: StudentId,));
                    },
                    child: const Text('Student books',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17,),

              //text button delete user acc
              Center(
                child: TextButton(onPressed: ()
                {
                  AppCubit.get(context).indexStudent= StudentId;
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
                  child: Text('Delete student account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
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
    return Dialog(
      elevation: 0,
      //backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 22),
          Text("${widget.description},",
                style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 20),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: ()
              {
                AppCubit.get(context).deleteStudentAccount();
                showToast(
                    message: 'Account deleted successfully',
                    state: ToastStates.SUCCESS );
                navigateAndEnd(context, AdminHomeScreen(),);

              },
              child: Center(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
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


