import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

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
      listener: (context, state) {
        // if(state is AdminUploadBooksSuccessState)
        // {
        //   AppCubit.get(context).ocrBookConverter(
        //       bookId: AppCubit.get(context).uploadBooksModel!.sId
        //   );
        //   print('IIIIIIIIIIIIIDDDDDDDDDDDDDDDDDDDD${AppCubit.get(context).uploadBooksModel!.sId}');
        // }
        //
      },
      builder: (context, state) {
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
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
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
                                    if (AppCubit.get(context).coverFile != null)
                                      Center(
                                        child: CircleAvatar(
                                          radius: 111,
                                          backgroundImage:  FileImage(AppCubit.get(context).coverFile!),
                                        ),
                                      ),
                                    if (AppCubit.get(context).coverFile == null)
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
                                        AppCubit.get(context).selectCover();
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
                            fontSize: size.width * 0.035,
                            context: context,
                            height: size.height * 0.1,
                            width: size.width,
                            color: ButtonPrimaryLightColor,
                            textColor: Colors.black,
                          ),
                          SizedBox(height: size.height * 0.03,),
                          defaultButton(
                            function: ()
                            {
                              print(' cover of book is ---->${AppCubit.get(context).coverFile}');
                              print(' name of book is ---->${nameController.text}');
                              print(' description of book is ---->${descriptionController.text}');
                              print(' pdf of book is ---->${AppCubit.get(context).pdf!}');
                              if (formKey.currentState!.validate())
                              {
                                if(AppCubit.get(context).coverFile != null && AppCubit.get(context).pdf != null)
                                {
                                  AppCubit.get(context).uploadBookData(
                                    cover: AppCubit.get(context).coverFile!,
                                    name: nameController.text,
                                    description: descriptionController.text,
                                    pdf: AppCubit.get(context).pdf!,
                                  );
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  showToast(message: 'Uploading...', state: ToastStates.SUCCESS);
                                }else
                                {
                                  showToast(message: 'Error! please try again and check *Cover, PDF, Name, Category, Description*', state: ToastStates.ERROR);
                                }
                              }
                            },
                            text: 'upload book',
                            fontSize: size.width * 0.035,
                            context: context,
                            height: size.height * 0.1,
                            width: size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) ,
        );
      },
    );
  }
}