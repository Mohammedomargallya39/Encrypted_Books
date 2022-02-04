import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_cubit.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var otpController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterCubit(),
      child: BlocConsumer<UserRegisterCubit, UserRegisterStates>(
        listener: (context, state) {
          if (state is UserRegisterSuccessState) {
            showToast(message: 'Register Success', state: ToastStates.SUCCESS);
            // navigateTo(context, UserHomeScreen());
            navigateTo(context, LoginScreen());
          } else if (state is UserRegisterErrorState)
          {
            showToast(message: 'Error!! please try again.', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          var cubit = UserRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Text(
                          'Register to your account',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultFormField(
                        maxLines: 1,
                        text: 'Name',
                        controller: nameController,
                        prefix: Icons.person,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'You have to enter your name';
                          }
                        },
                        type: TextInputType.text,
                        context: context,
                      ),
                      const SizedBox(
                        height: 27.5,
                      ),

                      defaultFormField(
                          maxLines: 1,
                          text: 'Academic E-mail',
                          controller: emailController,
                          prefix: Icons.email_outlined,
                          validate: (String value) {
                            if (value.isEmpty ||
                                !value.contains('hti.edu.eg')) {
                              return 'You have to enter you academic e-mail. ex: 42018183@hti.edu.eg. then press on send icon.';
                            }
                          },
                          type: TextInputType.emailAddress,
                          context: context,
                          suffix: Icons.send_outlined,
                          suffixPressed: () {
                            sendOTP();
                          }
                        ),
                      const SizedBox(
                        height: 27.5,
                      ),

                      defaultFormField(
                        maxLines: 1,
                        text: 'OTP code',
                        controller: otpController,
                        prefix: Icons.messenger_outline,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'You have to enter OTP code right';
                          }
                        },
                        type: TextInputType.phone,
                        context: context,
                      ),

                      const SizedBox(
                        height: 27.5,
                      ),

                      defaultFormField(
                          maxLines: 1,
                          isPassword: cubit.isPassword,
                          text: 'Password',
                          controller: passwordController,
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                          suffixPressed: () {
                            cubit.changeSuffix();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'you have to enter your password';
                            }
                          },
                          onSubmit: (String value) {
                            // if (formKey.currentState!.validate()) {
                            //   cubit.userLogin(
                            //       email: emailController.text,
                            //       password: passwordController.text);
                            // }
                          },
                          type: TextInputType.visiblePassword,
                          context: context),

                      const SizedBox(
                        height: 27.5,
                      ),

                      defaultFormField(
                        maxLines: 1,
                        text: 'Phone',
                        controller: phoneController,
                        prefix: Icons.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'You have to enter your phone';
                          }
                        },
                        type: TextInputType.phone,
                        context: context,
                      ),

                      const SizedBox(
                        height: 27.5,
                      ),

                      Text(
                        'Select your department:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(
                        height: 27.5,
                      ),

                      // ListTitle

                      ListTile(
                        title: Text(
                          'Engineering',
                          style: TextStyle(color: Colors.blue),
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue:
                              UserRegisterCubit.get(context).currentIndex,
                          //groupValue: 1,
                          onChanged: (int?value) {
                            UserRegisterCubit.get(context)
                                .changeRadioButton(index: value);
                          },
                          activeColor: Colors.blue,
                          toggleable: true,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Computer Science',
                          style: TextStyle(color: Colors.blue),
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue:
                              UserRegisterCubit.get(context).currentIndex,
                          //groupValue: 2,
                          onChanged: (int? value) {
                            UserRegisterCubit.get(context)
                                .changeRadioButton(index: value);
                            print('change radio buttom value');
                          },
                          activeColor: Colors.blue,
                          toggleable: true,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Commerce',
                          style: TextStyle(color: Colors.blue),
                        ),
                        leading: Radio(
                          value: 3,
                          groupValue:
                              UserRegisterCubit.get(context).currentIndex,
                          //groupValue: 3,
                          onChanged: (int? value) {
                            UserRegisterCubit.get(context)
                                .changeRadioButton(index: value);
                          },
                          activeColor: Colors.blue,
                          toggleable: true,
                        ),
                      ),

                      const SizedBox(
                        height: 33.33,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(55, 10, 55, 0),
                          child: SizedBox(
                            //color: Colors.blue.shade400,
                            width: double.infinity,
                            height: 55.55,
                            child: ConditionalBuilder(
                              condition: state is! UserLoginLoadingState,
                              builder: (context) => MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                elevation: 17.5,
                                color: defaultColor,
                                onPressed: () {
                                  verifyOTP();
                                  if (formKey.currentState!.validate() && UserRegisterCubit.get(context).currentIndex != 0) {
                                    UserRegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      name: nameController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      isEng:
                                          UserRegisterCubit.get(context).isEng,
                                      isMan:
                                          UserRegisterCubit.get(context).isMan,
                                      isCom:
                                          UserRegisterCubit.get(context).isCom,
                                    );
                                    // sendOTP();
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>OTPScreen())
                                    //
                                    // );
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33.33,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void sendOTP() async {
    var emailAuth = new EmailAuth(sessionName: 'Send OTP');
    var res = await emailAuth.sendOtp(recipientMail: emailController.text);
    if (res) {
      print('OTP sent');
    } else {
      print('try again later');
    }
  }

  void verifyOTP() async {
    var emailAuth = new EmailAuth(sessionName: 'Verify OTP');
    var res = await emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: otpController.text);
    if (res) {
      print('OTP verified');
    } else {
      print('try again later');
    }
  }
}
