import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_cubit.dart';
import 'package:social/lib/modules/login_screens/register_screen.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/components/constants.dart';
import 'package:social/lib/shared/network/local/cache_helper.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit, LoginStates>(
        listener: (context, state) {
              print("1"+'$token');
          if (state is UserLoginSuccessState) {
              print("2"+'$token');
              CacheHelper.saveData(key: 'isAdmin', value: state.loginModel.isAdmin).then((value) {
                isAdmin = state.loginModel.isAdmin;
                print('is admin saved successfully');
              });
              CacheHelper.saveData(key: 'token', value: state.loginModel.token).then((value)
              {
                token = state.loginModel.token ;
                navigateAndEnd(
                  context,
                  UserLoginCubit.get(context).loginModel!.isAdmin
                      ? AdminDrawerScreen()
                      : UserDrawerScreen(),
                );
              } );

              {
                showToast(message: 'Login Successfully', state: ToastStates.SUCCESS);
              }
          }
          if(state is UserLoginErrorState) {
            showToast(message: 'Error! Check Your Email and Password and try again.', state: ToastStates.ERROR);
          }
          if (state is AdminLoginSuccessState) {
                print("2"+'$token');
                CacheHelper.saveData(key: 'isAdmin', value: state.loginModel.isAdmin).then((value) {
                  isAdmin = state.loginModel.isAdmin;
                  print('is admin saved successfully');
                });
                CacheHelper.saveData(key: 'token', value: state.loginModel.token).then((value)
                {
                  token = state.loginModel.token;
                  // if (emailController.text[0] != int)
                  // {
                  //   UserRegisterCubit.get(context).makeAdmin(studentId: state.loginModel.id);
                  // }
                  navigateAndEnd(
                    context,
                    UserLoginCubit.get(context).loginModel!.isAdmin
                        ? AdminDrawerScreen()
                        : UserDrawerScreen(),
                  );
                } );

                {
                  showToast(message: 'Login Successfully', state: ToastStates.SUCCESS);
                }
              }
          if(state is AdminLoginErrorState) {
                showToast(message: 'Error! Check Your Email and Password and try again.', state: ToastStates.ERROR);
              }
        },
        builder: (context, state) {
          var cubit = UserLoginCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body:
                Container(
                  width: double.infinity,
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
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  SvgPicture.asset('assets/icons/login.svg',
                                  height: size.height * 0.35,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(height: size.height *0.019,),
                                  defaultFormField(
                                    maxLines: 1,
                                    text: 'E-mail',
                                    controller: emailController,
                                    prefix: Icons.email_outlined,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'E-mail must not be empty';
                                      }
                                    },
                                    type: TextInputType.emailAddress,
                                    context: context,
                                  ),
                                  SizedBox(height: size.height *0.019,),
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
                                          return 'password must not be empty';
                                        }
                                      },
                                      // onSubmit: (String value) {
                                      //   if (formKey.currentState!.validate()) {
                                      //     cubit.userLogin(
                                      //         email: emailController.text,
                                      //         password: passwordController.text);
                                      //   }
                                      // },
                                      type: TextInputType.visiblePassword,
                                      context: context),
                                  SizedBox(height: size.height *0.038,),
                                  Center(
                                    child: ConditionalBuilder(
                                      condition: state is! UserLoginLoadingState,
                                      builder: (context) =>
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                          child:
                                          defaultButton(
                                            function: ()
                                            {
                                            if (formKey.currentState!.validate())
                                            {
                                              if(emailController.text[0].contains(new RegExp(r'[0-9]')))
                                              {
                                                UserLoginCubit.get(context).userLogin(
                                                    email: emailController.text,
                                                    password: passwordController.text);
                                                debugPrint('Second condition');
                                              }else
                                              {
                                                UserLoginCubit.get(context).adminLogin(
                                                    email: emailController.text,
                                                    password: passwordController.text);

                                                debugPrint('Third condition ${passwordController.text}');
                                              }

                                              debugPrint('First condition');

                                            }

                                            },
                                            text: 'Login',
                                            fontSize: size.width * 0.035,
                                            context: context,
                                            height: size.height * 0.1,
                                            width: size.width,
                                          ),
                                        ),
                                      fallback: (context) => const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Do not have an account?',
                                      style: TextStyle(
                                        color: defaultColor,
                                      ),
                                      ),
                                      defaultTextButton(
                                          onPressed: ()
                                          {
                                            navigateTo(context, RegisterScreen());
                                          },
                                          text: 'SignUp',
                                          fontSize: size.width * 0.044,
                                      ),
                                    ],
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
        },
      ),
    );
  }
}