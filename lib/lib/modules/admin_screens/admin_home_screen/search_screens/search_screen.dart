import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/search_student_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/search_screens/student_details_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class StudentsSearchScreen extends StatelessWidget {
  StudentsSearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 120, 22, 120),
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
                            if (value!.isEmpty) {
                              return 'Search for students';
                            } else {
                              return null;
                            }
                          },
                          // onSubmit: (value) {
                          //   if (formKey.currentState!.validate()) {
                          //     AppCubit.get(context)
                          //         .CSSearchStudent(text: searchController.text);
                          //   }
                          // },
                        ),
                        if (state is AdminSearchStudentLoadingState) LinearProgressIndicator(),
                        SizedBox(
                          height: size.height * 0.044,
                        ),
                        if (state is AdminSearchStudentSuccessState)
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index)
                              {
                                return InkWell(
                                  child: SearchStudentsItem(
                                      SearchStudentModel(
                                        name: AppCubit.get(context).searchStudentModel![index].name,
                                        email: AppCubit.get(context).searchStudentModel![index].email!.split('@').first,
                                        pic: AppCubit.get(context).searchStudentModel![index].pic,
                                      ), context
                                  ),
                                  onTap: ()
                                  {
                                    navigateTo(context, StudentDetailsScreen(
                                      StudentId: index,
                                    ),
                                    );
                                  },
                                );
                              } ,

                              separatorBuilder: (context, index) => Container(
                                width: size.width,
                                color: Colors.grey,
                                height: size.height * 0.0009,
                              ),

                              itemCount: AppCubit.get(context).searchStudentModel!.length,
                            ),
                          ),
                      ],
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

  Widget SearchStudentsItem(SearchStudentModel searchStudentModel , context)
  {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>
      [
        Container(
          margin: const EdgeInsets.all(10),
          width: size.width * .18,
          height:size.height * .07,
          decoration:   BoxDecoration(shape: BoxShape.circle,
            image: DecorationImage(image:
            NetworkImage(searchStudentModel.pic!),
                fit: BoxFit.fill
            ),
          ),
        ),
        SizedBox(width: size.width * 0.001,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>
            [
              Text(searchStudentModel.name! ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 16 ,
                ),
              ),
              SizedBox(height: size.height * 0.0075,),
              Text(searchStudentModel.email!.split('@').first ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 16 ,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ) ;
  }
}
