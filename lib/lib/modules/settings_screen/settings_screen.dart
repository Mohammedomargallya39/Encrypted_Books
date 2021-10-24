import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/profile_screen/details_photo_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        nameController.text ='Mohammed Omar Abdelmonam Ahmed Hassan Salem Ali Gallya';
        passwordController.text ='kalkash2806';
        emailController.text ='mohammed.gallya39@gmail.com';
        phoneController.text ='01092479352';
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 11),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                    child: Center(
                      child: GestureDetector(
                        child: Stack(
                          children:[
                            Container(
                            margin: const EdgeInsets.all(10),
                            width: 225,
                            height: 225,
                            decoration:  const BoxDecoration(shape: BoxShape.circle,
                              image: DecorationImage(image:
                              NetworkImage('https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/127647071_1017495768677466_7815514853870818408_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeFRgzSgXqtOH1nplAvb_j8rE3Ks6IOpkVgTcqzog6mRWInNV_LK7qlPxrMCf1BvQKxWye6pjuVb81LLAKZZ33AO&_nc_ohc=6blo7UWUIzEAX-oiQlP&_nc_ht=scontent.fcai20-5.fna&oh=a1c9a8601f16af5247813b7dd97093dc&oe=61973284'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                             Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.camera_alt),
                              ),
                            ),
                          ] ,
                        ),
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return const DetailsPhotoDetails() ;
                          }));
                        },

                        onLongPress: ()
                        {

                        },

                      ),
                    ),
                  ),
                  const SizedBox(height: 22.5,),

                  const Text('42018183',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.22),),

                  const SizedBox(height: 33.3,),

                  defaultFormField(
                    type: TextInputType.name,
                    controller: nameController,
                    prefix: Icons.person,
                    text: 'Name',
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Name must not be empty';
                      }
                    },
                    context: context,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),



                  defaultFormField(
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    prefix: Icons.lock,
                    text: 'Password',
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Password must not be empty';
                      }
                    },
                    context: context,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),


                  defaultFormField(
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    prefix: Icons.email,
                    text: 'Email Address',
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Email Address must not be empty';
                      }
                    },
                    context: context,

                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    type: TextInputType.phone,
                    controller: phoneController,
                    prefix: Icons.phone,
                    text: 'Phone',
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Phone must not be empty';
                      }
                    },
                    context: context,
                  ),



                  const SizedBox(
                    height: 44.44,
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
                      },
                      child: const Text('Update Profile Settings',
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
          ) ,


        );
      },
    );
  }
}
