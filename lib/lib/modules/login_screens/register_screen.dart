import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/login_screens/otp_screen.dart';
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
      child: BlocConsumer<UserRegisterCubit, RegisterStates>(
        listener: (context, state) {
          // if (state is UserRegisterSuccessState){
          //   navigateAndEnd(
          //     context, LoginScreen(),);
          //   showToast(message: 'Register Success', state: ToastStates.SUCCESS);
          // }
          // if (state is UserRegisterErrorState){
          //   showToast(message: 'Register failed try again please!', state: ToastStates.SUCCESS);
          // }

        },
        builder: (context, state) {
          var cubit = UserRegisterCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
              ,onPressed: ()
              {
                Navigator.pop(context);
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            body: Container(
              width: double.infinity,
              height: size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset('assets/images/signup_top.png',
                      width: size.width * 0.35,),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset('assets/images/main_bottom.png',
                      width: size.width * 0.25,),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 66, 10, 22),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                    //fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            SvgPicture.asset('assets/icons/signup.svg',
                              height: size.height * 0.35,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
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
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            defaultFormField(
                              maxLines: 1,
                              text: 'Academic E-mail',
                              controller: emailController,
                              prefix: Icons.email_outlined,
                              validate: (String value) {
                                if (value.isEmpty
                                    ||
                                    !value.contains('hti.edu.eg')
                                ) {
                                  return 'You have to enter you academic e-mail. ex: xxxxxxxx@hti.edu.eg. then press on send icon.';
                                }
                              },
                              type: TextInputType.emailAddress,
                              context: context,
                              // suffix: Icons.send_outlined,
                              // suffixPressed: () {
                              //   // sendOTP();
                              // }
                            ),
                            // SizedBox(
                            //   height: size.height * 0.01,
                            // ),
                            //
                            // defaultFormField(
                            //   maxLines: 1,
                            //   text: 'OTP code',
                            //   controller: otpController,
                            //   prefix: Icons.messenger_outline,
                            //   validate: (String value) {
                            //     if (
                            //     value.isEmpty
                            //         &&
                            //     verifyOTP == otpController
                            //     ) {
                            //       return 'You have to enter OTP code right';
                            //     }
                            //   },
                            //   type: TextInputType.phone,
                            //   context: context,
                            // ),
                            SizedBox(
                              height: size.height * 0.01,
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
                                },
                                type: TextInputType.visiblePassword,
                                context: context),
                            SizedBox(
                              height: size.height * 0.01,
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
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select your department:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
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
                                'Business Management',
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
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Center(
                              child: ConditionalBuilder(
                                condition: state is! UserLoginLoadingState,
                                builder: (context) =>
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                      child: defaultButton(
                                        function: ()
                                        {
                                          if (
                                          formKey.currentState!.validate()
                                              &&
                                          UserRegisterCubit.get(context).currentIndex != 0
                                          ) {
                                            // UserRegisterCubit.get(context).userRegister(
                                            //   email: emailController.text,
                                            //   name: nameController.text,
                                            //   password: passwordController.text,
                                            //   phone: phoneController.text,
                                            //   isEng:
                                            //   UserRegisterCubit.get(context).isEng,
                                            //   isMan:
                                            //   UserRegisterCubit.get(context).isMan,
                                            //   isCom:
                                            //   UserRegisterCubit.get(context).isCom,
                                            // );
                                            sendOTP();
                                            navigateTo(context, OTPScreen(
                                                email: emailController.value.text,
                                                firstIndexInEmail: emailController.value.text[0],
                                                name: nameController.text,
                                                phone: phoneController.text,
                                                password: passwordController.text,
                                                isCS: UserRegisterCubit.get(context).isCom,
                                                isEng: UserRegisterCubit.get(context).isEng,
                                                isBusiness: UserRegisterCubit.get(context).isMan,
                                            ),
                                            );
                                            showToast(message: 'OTP code sent to your Academic E-mail', state: ToastStates.WARNING);
                                          }
                                        },
                                        text: 'Sign Up',
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
                              height: size.height * 0.001,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?',
                                  style: TextStyle(
                                    color: defaultColor,
                                  ),
                                ),
                                defaultTextButton(
                                  onPressed: ()
                                  {
                                    navigateTo(context, LoginScreen());
                                  },
                                  text: 'Login',
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
  void sendOTP() async {
    var emailAuth = new EmailAuth(sessionName: 'Send OTP');
    var res = await emailAuth.sendOtp(recipientMail: emailController.text);
    if (res) {
      print('OTP sent');
    } else {
      print('try again later');
    }
  }
// void verifyOTP() async {
//   var emailAuth = new EmailAuth(sessionName: 'Verify OTP');
//   var res = await emailAuth.validateOtp(
//       recipientMail: emailController.text, userOtp: otpController.text);
//   if (res) {
//     print('OTP verified');
//   } else {
//     print('try again later');
//   }
// }
}