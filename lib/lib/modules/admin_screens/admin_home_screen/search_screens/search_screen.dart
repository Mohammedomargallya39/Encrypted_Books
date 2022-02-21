import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/search_screens/student_details_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class StudentsSearchScreen extends StatelessWidget {
  StudentsSearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        return Scaffold(
          floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
            ,onPressed: ()
            {
              Navigator.pop(context);
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
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 55, 22, 0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height *0.044,
                          ),
                          defaultFormField(
                            context: context,
                            controller: searchController,
                            text: 'Search by name',
                            prefix: Icons.search,
                            suffix: Icons.forward,
                            suffixPressed: ()
                            {
                              AppCubit.get(context).SearchStudent(
                                  text: searchController.text
                              );
                            },
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (
                              value!.isEmpty
                                  ||
                              value.toString() == false

                              ) {
                                return 'Search for students';
                              } else {
                                return null;
                              }
                            },
                          ),
                          if (state is AdminSearchStudentLoadingState) LinearProgressIndicator(),
                          SizedBox(
                            height: size.height * 0.044,
                          ),
                          if (state is AdminSearchStudentSuccessState && formKey.currentState!.validate())
                            Expanded(
                              child: AnimationLimiter(
                                child: ListView.builder(
                                  padding: EdgeInsets.all(_w / 30),
                                  physics:
                                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                  itemCount: AppCubit.get(context).searchStudentModel!.length,
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
                                                      NetworkImage(AppCubit.get(context).searchStudentModel![index].pic!),
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
                                                        Text(AppCubit.get(context).searchStudentModel![index].name! ,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold ,
                                                            fontSize: 16 ,
                                                            color: Colors.black,

                                                          ),
                                                        ),
                                                        SizedBox(height: size.height * 0.0075,),
                                                        Text(AppCubit.get(context).searchStudentModel![index].email!.split('@').first ,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold ,
                                                            fontSize: 16 ,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                                    child: Icon(Icons.arrow_forward_ios,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onTap: ()
                                              {
                                                navigateTo(context, StudentDetailsScreen(
                                                  StudentId: index,
                                                ),
                                                );
                                              },
                                            ) ,
                                            margin: EdgeInsets.only(bottom: _w / 20),
                                            height: _w / 4,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } ,
    );
  }
}