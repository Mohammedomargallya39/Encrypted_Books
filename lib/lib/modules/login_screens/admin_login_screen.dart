import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_home_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';



class AdminLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController =     TextEditingController();
  var passwordController =  TextEditingController();

  AdminLoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminLoginCubit(),
      child: BlocConsumer<AdminLoginCubit,AdminLoginStates>
        (
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = AdminLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              // title: const Text('Login as admin'),
              ),
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
                        height: 200.0,
                        child: Image(
                          color: defaultColor,
                          image: AssetImage('assets/images/ebook.png',),
                          height: 80.0,
                          width: 80.0,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 40.0,),

                    Center(child: const Text('Login as admin', style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),)),
                    // Text('Login to your account',
                    //   style: Theme.of(context).textTheme.bodyText2,
                    // ),
                    const SizedBox(height: 50.0,),
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
                            cubit.adminLogin(
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
                              condition: state is! AdminLoginLoadingState ,
                              builder: (context)=>
                                  MaterialButton(

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    elevation: 17.5,
                                    color: defaultColor,
                                    onPressed: ()
                                    {
                                      navigateAndEnd(context, const AdminHomeScreen());
                                    },

                                    child: const Text('LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
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





