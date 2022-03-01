import 'dart:io';

import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_cubit.dart';
import 'package:social/lib/modules/login_screens/register_cubit/register_states.dart';
import 'package:social/lib/shared/components/components.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen(
      {
        Key? key,
        required this.email,
        required this.name,
        required this.phone,
        required this.password,
        required this.isCS,
        required this.isEng,
        required this.isBusiness,
      }
      ) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var otpController = TextEditingController();
  final dynamic name;
  final dynamic email;
  final dynamic phone;
  final dynamic password;
  final dynamic isCS;
  final dynamic isEng;
  final dynamic isBusiness;

  var verify;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserRegisterCubit() ,
      child: BlocConsumer<UserRegisterCubit,UserRegisterStates>(
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
          return Scaffold(
            floatingActionButton: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 30,
                  child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
                  {
                    Navigator.pop(context);
                  }, iconSize: 23,
                  ),
                ),
              ],
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            SvgPicture.asset('assets/images/otp.svg',
                              height: size.height * 0.3,),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            defaultFormField(
                              maxLines: 1,
                              text: 'OTP code',
                              controller: otpController,
                              prefix: Icons.messenger_outline,
                              // validate: (String value) {
                              //   if (
                              //   false == verify || null == verify
                              //   ) {
                              //     return 'You have to enter OTP code right';
                              //   }
                              // },
                              type: TextInputType.phone,
                              context: context,
                            ),

                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Center(
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                child: defaultButton(
                                  function: ()
                                  {

                                    verifyOTP();
                                    print('verify is_________>${verify}');
                                    if (true == verify)
                                    {
                                      print('test verify OTP');
                                      UserRegisterCubit.get(context).userRegister(
                                        email: email,
                                        name:  name,
                                        password: password,
                                        phone:  phone,
                                        isEng: isEng,
                                        isMan: isBusiness,
                                        isCom: isCS,
                                      );
                                      UserRegisterCubit.get(context).userRegister(
                                        email: email,
                                        name:  name,
                                        password: password,
                                        phone:  phone,
                                        isEng: isEng,
                                        isMan: isBusiness,
                                        isCom: isCS,
                                      );
                                      showToast(message: 'Account Created', state: ToastStates.SUCCESS);
                                      navigateAndEnd(context, LoginScreen());
                                    }if (false == verify)
                                    {
                                      showToast(message: 'Failed! check code and try again please', state: ToastStates.ERROR);
                                    }if (null == verify)
                                    {
                                      return null ;
                                    }
                                  },
                                  text: 'Verified',
                                  fontSize: size.width * 0.044,
                                  context: context,
                                  height: size.height * 0.1,
                                  width: size.width,
                                ),
                              ),
                            ),


                          ],

                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void verifyOTP() async {
    var emailAuth = new EmailAuth(sessionName: 'Verify OTP');
    //emailAuth.config(remoteServerConfiguration);
    var res = await emailAuth.validateOtp(
        recipientMail: email, userOtp: otpController.value.text);
    verify = res ;
    print('++++++++ ${res}');
    print('++++++++ ${verify}');
    if (res) {
      print('+++++++OTP verified++++++++ ${res}');
    } else {
      print('+++++++try again later++++++++ ${res}');
    }
    // bool? verify() {
    //   print(emailAuth.validateOtp(
    //       recipientMail:  email.value,
    //       userOtp: otpController.value.text));
    // }
  }
}
