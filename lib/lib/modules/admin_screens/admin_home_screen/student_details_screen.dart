import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:social/lib/cubit/cubit.dart';
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
            AppCubit.get(context).studentsModel![StudentId].name!
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
                            AppCubit.get(context).studentsModel![StudentId].image!
                        ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 33.33,),
              const Text('Name :',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
               SizedBox(
                width: double.infinity,
                child: Text(
                  AppCubit.get(context).studentsModel![StudentId].name!
                  ,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 19,),),
              ),
              const SizedBox(height: 8,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 22,),
              const Text('ID :',
                style: TextStyle(fontSize: 33,
                    fontWeight:
                    FontWeight.bold),),
              const SizedBox(height: 8,),
               Text(
                AppCubit.get(context).studentsModel![StudentId].email!.split('@').first
                ,
                style: TextStyle(
                  fontSize: 19,),),
              const SizedBox(height: 8,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 22,),
              const Text('NO. of books :',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
               Text(
                '${AppCubit.get(context).studentsModel![StudentId].numberofBooks!}'
                ,
                style: TextStyle(
                  fontSize: 19,),),
              const SizedBox(height: 8,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 22,),
              const Text('Acc created in:',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
              Text(
                '${AppCubit.get(context).studentsModel![StudentId].createdAt!}'
                ,
                style: TextStyle(
                  fontSize: 19,),),
              const SizedBox(height: 8,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 22,),
              const Text('Last updated in :',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
              Text(
                '${AppCubit.get(context).studentsModel![StudentId].updatedAt!}'
                ,
                style: TextStyle(
                  fontSize: 19,),),
              const SizedBox(height: 8,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 33,),
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
                      debugPrint('${AppCubit.get(context).studentsModel![StudentId].books!.length}');
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
              const SizedBox(height: 33,),
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
                    },
                    child: const Text('Delete student Acc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
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


