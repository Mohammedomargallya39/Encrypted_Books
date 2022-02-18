import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';

class ChangePasswordScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController() ;
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 11),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset('assets/images/forget_password.svg',height: size.height * 0.4,),


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

                              SizedBox(height: size.height *0.05,),

                              defaultButton(
                                function: ()
                                {
                                  if (formKey.currentState!.validate())
                                  {
                                    AppCubit.get(context).updateUserData(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text
                                    );
                                    showToast(message: 'password changed', state: ToastStates.SUCCESS);
                                  }

                                },
                                text: 'change password',
                                context: context,
                                height: size.height * 0.08,
                                width: size.width,
                              ),

                              // SizedBox(
                              //   width: size.width ,
                              //   height: size.height * 0.06,
                              //   child: MaterialButton(
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(22.0),
                              //     ),
                              //     elevation: 5,
                              //     color: defaultColor,
                              //     onPressed: ()
                              //     {
                              //       if (formKey.currentState!.validate())
                              //       {
                              //         AppCubit.get(context).updateUserData(
                              //             name: nameController.text,
                              //             phone: phoneController.text,
                              //             password: passwordController.text
                              //         );
                              //         navigateAndEnd(context, UserSettingsScreen());
                              //         showToast(message: 'password changed', state: ToastStates.SUCCESS);
                              //       }
                              //
                              //     },
                              //     child: const Text('Change password',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
