import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';

import 'all_books_screen.dart';

class BusinessStudentAccessBookScreen extends StatefulWidget {
  const BusinessStudentAccessBookScreen({Key? key,required this.BusinessAccessIndexBookId}) : super(key: key);
  final dynamic BusinessAccessIndexBookId;

  @override
  State<BusinessStudentAccessBookScreen> createState() => _BusinessStudentAccessBookScreenState();
}

class _BusinessStudentAccessBookScreenState extends State<BusinessStudentAccessBookScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getStudents();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).businessStudentsModel != null,
          builder: (context) => Scaffold(
            floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
              ,onPressed: ()
              {
                navigateAndEnd(context, AdminBooksScreen());
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            body: Container(
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
                  Positioned(
                    top: size.height * 0.04,
                    //left: 0,
                    // bottom: 0,
                    //right: 0,
                    child: SvgPicture.asset('assets/images/admin_cover.svg',
                      width: size.width * 0.3,
                      height: size.height * 0.18,
                      //color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        size.height * 0.2,
                        0,
                        0
                    ),
                    child: AnimationLimiter(
                      child: ListView.builder(
                        padding: EdgeInsets.all(_w / 30),
                        physics:
                        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        itemCount: AppCubit.get(context).businessStudentsModel!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              verticalOffset: -250,
                              child: ScaleAnimation(
                                duration: Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Container(
                                  child: InkWell(
                                    child: Row(
                                      children: <Widget>
                                      [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          width: size.width * .18,
                                          height:size.height * .07,
                                          decoration:   BoxDecoration(shape: BoxShape.circle,
                                            image: DecorationImage(image:
                                            NetworkImage(AppCubit.get(context).businessStudentsModel![index].image!),
                                                fit: BoxFit.fill
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.001,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:  <Widget>
                                            [
                                              Text(AppCubit.get(context).businessStudentsModel![index].name! ,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold ,
                                                  fontSize: size.width * 0.04,
                                                  //    color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: size.height * 0.0075,),
                                              Text(AppCubit.get(context).businessStudentsModel![index].email!.split('@').first ,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold ,
                                                  fontSize: size.width * 0.04,
                                                  //  color: Colors.black,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                          child: IconButton(
                                            icon: Icon(Icons.remove),
                                            color: Colors.red,
                                            onPressed:()
                                            {
                                              AppCubit.get(context).removeBookFromStudent(
                                                bookId: widget.BusinessAccessIndexBookId,
                                                studentId: AppCubit.get(context).businessStudentsModel![index].sId ,
                                              );
                                              showToast(message: 'Book removed successfully to ${AppCubit.get(context).businessStudentsModel![index].email!.split('@').first}', state: ToastStates.SUCCESS);
                                            },
                                            //color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                          child: IconButton(
                                            icon: Icon(Icons.add),
                                            color: Colors.green,
                                            onPressed:()
                                            {
                                              AppCubit.get(context).addBookToStudent(
                                                bookId: widget.BusinessAccessIndexBookId,
                                                studentId: AppCubit.get(context).businessStudentsModel![index].sId ,
                                              );
                                              showToast(message: 'Book add successfully to ${AppCubit.get(context).businessStudentsModel![index].email!.split('@').first}', state: ToastStates.SUCCESS);
                                            },
                                            //color: Colors.black,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ) ,
                                  margin: EdgeInsets.only(bottom: _w / 20),
                                  height: _w / 4,
                                  decoration: BoxDecoration(
                                    color: ThemeCubit.get(context).darkTheme?Colors.grey.shade700:Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
