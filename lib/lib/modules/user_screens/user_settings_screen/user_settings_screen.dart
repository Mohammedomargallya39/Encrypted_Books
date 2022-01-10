import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_details_photo_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'change_password.dart';

class UserSettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController() ;
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        nameController.text =AppCubit.get(context).userModel!.name;
        phoneController.text =AppCubit.get(context).userModel!.phone;
      },
      builder: (context, state)
      {
        nameController.text =AppCubit.get(context).userModel!.name;
        phoneController.text =AppCubit.get(context).userModel!.phone;
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
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
                                // Center(
                                //   child: Container(
                                //     margin: const EdgeInsets.all(10),
                                //     width:  275,
                                //     height: 275,
                                //     decoration:   BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: DecorationImage(image:
                                //       NetworkImage(AppCubit.get(context).userModel!.image),
                                //           fit: BoxFit.fill
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                    backgroundImage:  NetworkImage(AppCubit.get(context).userModel!.image),
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
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const UserDetailsPhotoDetails() ;
                            }));
                          },
                        ),
                      ),
                      const SizedBox(height: 22.5,),

                      Text(
                        AppCubit.get(context).userModel!.email.split('@').first,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.22),),

                      const SizedBox(height: 44.4,),

                      defaultFormField(
                        type: TextInputType.name,
                        controller: nameController,
                        prefix: Icons.person,
                        text: 'Change Name',
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Name must not be empty';
                          }
                        },
                        context: context,
                      ),
                      const SizedBox(
                        height: 33.3,
                      ),


                      defaultFormField(
                        type: TextInputType.phone,
                        controller: phoneController,
                        prefix: Icons.phone,
                        text: 'Change Phone',
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Phone must not be empty';
                          }
                        },
                        context: context,
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
                                AppCubit.get(context).updateUserImage(pic: AppCubit.get(context).imageFile!);
                                showToast(message: 'Updated', state: toastStates.SUCCESS);
                              }
                              if (AppCubit.get(context).imageFile == null)
                              {
                                AppCubit.get(context).userModel!.image;
                              }
                              AppCubit.get(context).updateUserData(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text
                              );
                              showToast(message: 'Updated', state: toastStates.SUCCESS);
                              AppCubit.get(context).getUserData();
                            }
                          },
                          child: const Text('Update Profile Data',
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

                      TextButton(
                          onPressed: ()
                          {
                            navigateTo(context, ChangePasswordScreen());
                          },
                          child: Text('change password' ,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                      ),




                    ],
                  ),
                ),
              ),
            ) ,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
