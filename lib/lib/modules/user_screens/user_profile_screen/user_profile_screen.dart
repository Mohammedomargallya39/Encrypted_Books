import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'user_details_photo_screen.dart';

class  UserProfileScreen extends StatelessWidget {

   UserProfileScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  <Widget>
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 33, 0, 0),
                      child: Center(
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 275,
                            height: 275,
                            decoration:   BoxDecoration(shape: BoxShape.circle,
                              image: DecorationImage(image:
                              NetworkImage(AppCubit.get(context).userModel!.image),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const UserDetailsPhotoDetails() ;
                            }));
                          },
                        ),
                      ),
                    ),



                    const SizedBox(height: 33.33,),
                    const Text('Name :',
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8,),
                    Container(
                      width: double.infinity,
                      child: Text( AppCubit.get(context).userModel!.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19,),),
                    ),
                    const SizedBox(height: 8,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),

                    const SizedBox(height: 22,),
                    const Text('ID :',
                      style: TextStyle(fontSize: 33,
                          fontWeight:
                          FontWeight.bold),),
                    const SizedBox(height: 8,),
                     Text(AppCubit.get(context).userModel!.email.split('@').first,
                      style: TextStyle(
                        fontSize: 19,),),
                    const SizedBox(height: 8,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),

                    const SizedBox(height: 22,),
                    const Text('NO. of books :',
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8,),
                    const Text('7',
                      style: TextStyle(
                        fontSize: 19,),),
                    const SizedBox(height: 8,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );

  }
}



