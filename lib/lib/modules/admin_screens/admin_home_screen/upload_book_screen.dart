import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';
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
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Upload book'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(11, 44, 11, 11),
            child: Column(
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    child: SizedBox(
                      width:  220,
                      height: 235,
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

                const SizedBox(height: 44.4,),

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
                const SizedBox(
                  height: 33.3,
                ),
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

                const SizedBox(
                  height: 33.3,
                ),


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
                const SizedBox(
                  height: 33.3,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 44.44,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 17.5,
                    color: ButtonPrimaryLightColor,
                    onPressed: ()
                    {
                      AppCubit.get(context).selectPDF();

                    },
                    child: const Text('Choose PDF',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 66,
                ),
                SizedBox(
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
                      if (formKey.currentState!.validate())
                      {
                        if (AppCubit.get(context).imageFile != null)
                        {
                          AppCubit.get(context).uploadBookImage(cover: AppCubit.get(context).imageFile!);
                          showToast(message: 'Uploaded', state: ToastStates.SUCCESS);
                        }
                        if (AppCubit.get(context).imageFile == null)
                        {
                          Image.asset('assets/images/upload_book.png');
                        }
                        // File? pdf;
                        if(AppCubit.get(context).pdf != null);
                        {
                          AppCubit.get(context).uploadBookPdf(
                              pdf: AppCubit.get(context).pdf!
                          );
                        }
                        // if(AppCubit.get(context).pdf != null);
                        // {
                        //
                        // }
                        AppCubit.get(context).uploadBooks(
                            name: nameController.text,
                            category: categoryController.text,
                            description: descriptionController.text
                        );
                        showToast(message: 'Uploaded', state: ToastStates.SUCCESS);
                        navigateTo(context, AdminHomeScreen());
                        //AppCubit.get(context).getAdminBooks();
                      }
                    },
                    child: const Text('Upload Book',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33.3,
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
