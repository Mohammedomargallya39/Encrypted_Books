import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/cs_students_screens/cs_student_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class AdminsDetailsScreen extends StatelessWidget {
  const AdminsDetailsScreen({Key? key, required this.AdminId}) : super(key: key);
  final int AdminId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppCubit.get(context).adminsModel![AdminId].name!
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
                            AppCubit.get(context).adminsModel![AdminId].image!
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
                      AppCubit.get(context).adminsModel![AdminId].name!
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
                      AppCubit.get(context).adminsModel![AdminId].email!.split('@').first
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
                      '${AppCubit.get(context).adminsModel![AdminId].createdAt!.split('T').first}'
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
                      '${AppCubit.get(context).adminsModel![AdminId].updatedAt!.split('T').first}'
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

            ],
          ),
        ),
      ),
    );
  }
}


