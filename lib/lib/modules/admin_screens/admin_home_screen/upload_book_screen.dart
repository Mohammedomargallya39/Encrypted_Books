import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'admin_home_screen.dart';

class UploadBookScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController() ;
  var categoryController = TextEditingController();
  var descriptionController = TextEditingController();

  UploadBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Upload book'),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 17, 11, 11),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: GestureDetector(
                        child: SizedBox(
                          width:  size.width * 0.5,
                          height: size.height * 0.23,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:[
                              if (AppCubit.get(context).imageFile != null)
                                Center(
                                  child: CircleAvatar(
                                    radius: 111,
                                    backgroundImage:  FileImage(AppCubit.get(context).imageFile!),
                                  ),
                                ),
                              if (AppCubit.get(context).imageFile == null)
                                Center(
                                  child: CircleAvatar(
                                    radius: 111,
                                    child: Image.asset('assets/images/upload_book.png'),
                                  ),
                                ),
                              IconButton(
                                color: defaultColor,
                                iconSize: 33,
                                onPressed: ()
                                {
                                  AppCubit.get(context).selectImage();
                                },
                                icon: const Icon(Icons.camera_alt),
                              ),
                            ] ,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.05,),

                    defaultFormField(
                      type: TextInputType.name,
                      controller: nameController,
                      prefix: Icons.drive_file_rename_outline,
                      text: 'Book Name',
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter book name.';
                        }
                      },
                      context: context,
                    ),
                    SizedBox(height: size.height * 0.01,),

                    defaultFormField(
                      type: TextInputType.name,
                      controller: categoryController,
                      prefix: Icons.drive_file_rename_outline,
                      text: 'Book Category',
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter book category';
                        }
                      },
                      context: context,
                    ),
                    SizedBox(height: size.height * 0.01,),
                    defaultFormField(
                      type: TextInputType.name,
                      controller: descriptionController,
                      prefix: Icons.drive_file_rename_outline,
                      text: 'Book Description',
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter book description';
                        }
                      },
                      context: context,
                    ),
                    SizedBox(height: size.height * 0.01,),

                    defaultButton(
                      function: ()
                      {
                        AppCubit.get(context).selectPDF();
                      },
                      text: 'Choose PDf',
                      context: context,
                      height: size.height * 0.08,
                      width: size.width,
                      color: ButtonPrimaryLightColor,
                      textColor: Colors.black,
                    ),
                    SizedBox(height: size.height * 0.025,),
                    defaultButton(
                      function: ()
                      {
                        if (formKey.currentState!.validate())
                        {
                          if(AppCubit.get(context).imageFile != null && AppCubit.get(context).pdf != null)
                          {
                            AppCubit.get(context).uploadBookData(
                              cover: AppCubit.get(context).imageFile!,
                              name: nameController.text,
                              category: categoryController.text,
                              description: descriptionController.text,
                              pdf: AppCubit.get(context).pdf!,
                            );
                            showToast(message: 'Uploaded', state: ToastStates.SUCCESS);
                          }else
                          {
                            showToast(message: 'Error! please try again and check *Cover, PDF, Name, Category, Description*', state: ToastStates.ERROR);
                          }
                          //navigateTo(context, AdminHomeScreen());
                          // Restart.restartApp();
                        }
                      },
                      text: 'upload book',
                      context: context,
                      height: size.height * 0.08,
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
          ) ,
        );
      },
    );
  }
}
