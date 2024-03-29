import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:social/lib/shared/styles/colors.dart';

class AdminsDetailsScreen extends StatelessWidget {
  const AdminsDetailsScreen({Key? key, required this.AdminId}) : super(key: key);
  final int AdminId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
        ,onPressed: ()
        {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<ThemeCubit,ThemeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      <Widget>
                      [
                        // الصورة
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
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
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015,),
                            Expanded(
                              child: Text(
                                AppCubit.get(context).adminsModel![AdminId].name!
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

                        //id
                        Row(
                          children: [
                            Text('ID:',
                              style: TextStyle(
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015,),
                            Expanded(
                              child: Text(
                                AppCubit.get(context).adminsModel![AdminId].email!.split('@').first
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

                        //Acc created in
                        Row(
                          children: [
                            Text('Acc created in:',
                              style: TextStyle(
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015,),
                            Expanded(
                              child: Text(
                                '${AppCubit.get(context).adminsModel![AdminId].createdAt!.split('T').first}'
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

                        //Acc updated in
                        Row(
                          children: [
                            Text('Last updated in:',
                              style: TextStyle(
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015,),
                            Expanded(
                              child: Text(
                                '${AppCubit.get(context).adminsModel![AdminId].updatedAt!.split('T').first}'
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
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // // ListTitle
                        // defaultTextButton
                        //   (
                        //     onPressed: ()
                        //     {
                        //       AppCubit.get(context).makeAdmin(
                        //           studentId: AppCubit.get(context).adminsModel![AdminId].sId!
                        //       );
                        //     },
                        //     text: 'Admin',
                        //     color: defaultColor,
                        //   ),
                        //
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // // ListTitle
                        // defaultTextButton
                        //   (
                        //   onPressed: ()
                        //   {
                        //     AppCubit.get(context).makeCs(
                        //         studentId: AppCubit.get(context).adminsModel![AdminId].sId!
                        //     );
                        //   },
                        //   text: 'Computer Science (student)',
                        //   color: defaultColor,
                        // ),
                        //
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // // ListTitle
                        // defaultTextButton
                        //   (
                        //   onPressed: ()
                        //   {
                        //     AppCubit.get(context).makeEng(
                        //         studentId: AppCubit.get(context).adminsModel![AdminId].sId!
                        //     );
                        //   },
                        //   text: 'Engineering (student)',
                        //   color: defaultColor,
                        // ),
                        //
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // // ListTitle
                        // defaultTextButton
                        //   (
                        //   onPressed: ()
                        //   {
                        //     AppCubit.get(context).makeBusiness(
                        //         studentId: AppCubit.get(context).adminsModel![AdminId].sId!
                        //     );
                        //   },
                        //   text: 'Business Management (student)',
                        //   color: defaultColor,
                        // ),

                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}