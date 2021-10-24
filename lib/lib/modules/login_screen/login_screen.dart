import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/modules/encrypted_home_screen/encrypted_home.dart';
import 'package:social/lib/modules/login_screen/cubit/cubit.dart';
import 'package:social/lib/modules/login_screen/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';



class EncryptionLoginScreen extends StatelessWidget {



  var emailController =     TextEditingController();
  var passwordController =  TextEditingController();
  var formKey = GlobalKey<FormState>();

  EncryptionLoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EncryptionLoginCubit(),
      child: BlocConsumer<EncryptionLoginCubit,EncryptionStates>
        (
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = EncryptionLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('Encrypted Books'),),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    Center(
                      child: Container(
                        width: double.infinity,
                        height: 300.0,
                        child: const Image(
                          color: defaultColor,
                          image: AssetImage('assets/images/ebook.png',),
                          height: 90.0,
                          width: 90.0,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    const Text('LOGIN', style: TextStyle(fontSize: 44 , fontWeight: FontWeight.bold),),
                    Text('Login to your account',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 33.0,),
                    defaultFormField(
                      maxLines: 1,
                       text: 'E-mail',
                        controller: emailController,
                        prefix: Icons.email_outlined,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                          {
                            return 'E-mail must not be empty';
                          }
                        },
                        type: TextInputType.emailAddress,
                      context: context,),

                    const SizedBox(height: 27.5,),

//
// defaultFormField(
//     text: 'Password',
//
//     controller: passwordController,
//     prefix: Icons.lock,
//    // suffix: cubit.suffix,
//     suffixPressed: ()
//     {
//    //   cubit.changeSuffix();
//     },
//     // onSubmit: (String value)
//     // {
//     //
//     // },
//     validate: (String value)
//     {
//       if (value.isEmpty)
//       {
//         return 'password must not be empty';
//       }
//     },
//     type: TextInputType.visiblePassword,
//  // isPassword: cubit.isPassword,
//
// ),

                    defaultFormField(
                        maxLines: 1,
                        isPassword: cubit.isPassword,
                        text: 'Password',
                        controller: passwordController,
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changeSuffix();
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }
                        },

                        onSubmit: (String value) {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },

                        type: TextInputType.visiblePassword,

                        context: context),


                    const SizedBox(height: 33.33,),


                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(55,10,55,0),
                        child: Container(
                          //color: Colors.blue.shade400,
                          width: double.infinity,
                          height: 55.55,
                          child: ConditionalBuilder(
                            condition: state is! EncryptionLoginLoadingState ,
                            builder: (context)=>
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  elevation: 17.5,
                                  color: defaultColor,
                              onPressed: ()
                              {
                                 navigateAndEnd(context, const EncryptionLayout());
                              },

                                child: const Text('LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 33.33,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            fallback: (context)=> const Center(child: CircularProgressIndicator()),

                          )
                        ),
                      ),
                    ),
                    // const SizedBox(height: 33.33,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text('Don\'t have an account?'),
                    //     TextButton(onPressed: ()
                    //     {
                    //       navigateTo(context, EncryptionRegisterScreen());
                    //     },
                    //         child: const Text('Register now'))
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );

        },
      ),


    );
  }
}





