import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_home_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';



class UserLoginScreen extends StatelessWidget {



  var emailController =     TextEditingController();
  var passwordController =  TextEditingController();
  var formKey = GlobalKey<FormState>();

  UserLoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit,UserLoginStates>
        (
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = UserLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('User Login'),),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    const Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 300.0,
                        child: Image(
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
                        child: SizedBox(
                          //color: Colors.blue.shade400,
                          width: double.infinity,
                          height: 55.55,
                          child: ConditionalBuilder(
                            condition: state is! UserLoginLoadingState ,
                            builder: (context)=>
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  elevation: 17.5,
                                  color: defaultColor,
                              onPressed: ()
                              {
                                 navigateAndEnd(context, const UserHomeScreen());
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





