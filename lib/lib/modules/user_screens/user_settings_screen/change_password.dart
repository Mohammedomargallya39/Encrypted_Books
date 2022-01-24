import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_settings_screen/user_settings_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController() ;
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('change password'),
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 44, 11, 11),
                  child: Center(
                    child: Column(
                      children: <Widget>[


                        const SizedBox(
                          height: 20.0,
                        ),

                        defaultFormField(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          prefix: Icons.lock,
                          text: 'Add new password',
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Password must not be empty';
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
                                AppCubit.get(context).updateUserData(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text
                                );
                                navigateAndEnd(context, UserSettingsScreen());
                                showToast(message: 'password changed', state: toastStates.SUCCESS);
                              }

                            },
                            child: const Text('Change password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
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
