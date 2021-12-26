// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social/lib/modules/login_screens/login_screen.dart';
// import 'package:social/lib/modules/login_screens/register_cubit/register_cubit.dart';
// import 'package:social/lib/modules/login_screens/register_cubit/register_states.dart';
// import 'package:social/lib/modules/login_screens/register_screen.dart';
// import 'package:social/lib/shared/components/components.dart';
// import 'package:social/lib/shared/styles/colors.dart';
// import 'cubit/states.dart';
//
// class OTPScreen extends StatelessWidget {
//   OTPScreen({Key? key}) : super(key: key);
//
//   var formKey = GlobalKey<FormState>();
//   // var emailController = TextEditingController();
//   //var otpController = TextEditingController();
//   // var passwordController = TextEditingController();
//   // var nameController = TextEditingController();
//   // var phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserRegisterCubit(),
//       child: BlocConsumer<UserRegisterCubit, UserRegisterStates>(
//         listener: (context, state) {
//           if (state is UserRegisterSuccessState) {
//             showToast(message: 'Register Success', state: toastStates.SUCCESS);
//             // navigateTo(context, UserHomeScreen());
//             navigateAndEnd(context, LoginScreen());
//           } else if (state is UserRegisterErrorState)
//           {
//             showToast(message: 'Error!! please try again.', state: toastStates.ERROR);
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Register'),
//             ),
//             body: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(22.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(22.0),
//                         child: Text(
//                           'Verify the OTP code to complete the registration',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 27.5,
//                       ),
//
//
//                       defaultFormField(
//                         maxLines: 1,
//                         text: 'OTP code',
//                         controller: RegisterScreen().otpController,
//                         prefix: Icons.messenger_outline,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return 'You have to enter OTP code right';
//                           }
//                         },
//                         type: TextInputType.phone,
//                         context: context,
//                       ),
//
//                       const SizedBox(
//                         height: 27.5,
//                       ),
//
//
//
//                       // ListTitle
//                       const SizedBox(
//                         height: 33.33,
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(55, 10, 55, 0),
//                           child: SizedBox(
//                             //color: Colors.blue.shade400,
//                             width: double.infinity,
//                             height: 55.55,
//                             child: ConditionalBuilder(
//                               condition: state is! UserLoginLoadingState,
//                               builder: (context) => MaterialButton(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                 ),
//                                 elevation: 17.5,
//                                 color: defaultColor,
//                                 onPressed: () {
//                                   RegisterScreen().verifyOTP();
//                                   if (formKey.currentState!.validate()) {
//                                     UserRegisterCubit.get(context).userRegister(
//                                       email: RegisterScreen().emailController.text,
//                                       name: RegisterScreen().nameController.text,
//                                       password: RegisterScreen().passwordController.text,
//                                       phone: RegisterScreen().phoneController.text,
//                                       isEng:
//                                           UserRegisterCubit.get(context).isEng,
//                                       isMan:
//                                           UserRegisterCubit.get(context).isMan,
//                                       isCom:
//                                           UserRegisterCubit.get(context).isCom,
//                                     );
//                                     RegisterScreen().sendOTP();
//                                     RegisterScreen().verifyOTP();
//                                   }
//                                 },
//                                 child: const Text(
//                                   'Verify',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 33.33,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               fallback: (context) => const Center(
//                                   child: CircularProgressIndicator()),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 55
//                       ),
//                       Center(child: TextButton(
//                           onPressed: ()
//                           {
//                             RegisterScreen().sendOTP();
//                           },
//                           child: Text('send code again' ,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22
//                           ),
//                           ),
//                       ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // void sendOTP() async {
//   //   var emailAuth = new EmailAuth(sessionName: 'Send OTP');
//   //   var res = await emailAuth.sendOtp(recipientMail: RegisterScreen().emailController.text);
//   //   if (res) {
//   //     print('OTP sent');
//   //   } else {
//   //     print('try again later');
//   //   }
//   // }
//   //
//   // void verifyOTP() async {
//   //   var emailAuth = new EmailAuth(sessionName: 'Verify OTP');
//   //   var res = await emailAuth.validateOtp(
//   //       recipientMail: RegisterScreen().emailController.text, userOtp: RegisterScreen().otpController.text);
//   //   if (res) {
//   //     print('OTP verified');
//   //   } else {
//   //     print('try again later');
//   //   }
//   // }
// }
