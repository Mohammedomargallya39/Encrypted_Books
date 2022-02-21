import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'user_details_photo_screen.dart';

class  UserProfileScreen extends StatefulWidget {

   UserProfileScreen ({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}


class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AppCubit.get(context).getUserData();
    AppCubit.get(context).getUserBooks();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).homeModel != null,
          builder: (context) => Scaffold(
              floatingActionButton: IconButton(icon:Icon(Icons.home)
                ,onPressed: ()
                {
                  navigateTo(context, UserDrawerScreen());
                },
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
                    child: SingleChildScrollView(
                      child: BlocConsumer<ThemeCubit,ThemeStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            <Widget>
                            [
                              Center(
                                child: GestureDetector(
                                  child: SizedBox(
                                    width:  size.width * 0.5,
                                    height: size.height * 0.21,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children:[
                                        Center(
                                          child: CircleAvatar(
                                            radius: 111,
                                            backgroundImage:  NetworkImage(
                                                '${AppCubit.get(context).homeModel!.pic}'
                                            ),
                                          ),
                                        ),
                                      ] ,
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
                              SizedBox(height: size.height * 0.02,),
                              Center(
                                child: Text(
                                  AppCubit.get(context).homeModel!.email!.split('@').first,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                              ),
                              SizedBox(height: size.height * 0.04,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Text('Name:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width * 0.015,),
                                    Expanded(
                                      child: Text(
                                        '${AppCubit.get(context).homeModel!.name}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('E-mail:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width *0.015),
                                    Expanded(
                                      child: Text(
                                        '${AppCubit.get(context).homeModel!.email}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Phone:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width *0.015),
                                    Expanded(
                                      child: Text(
                                        '${AppCubit.get(context).homeModel!.phone}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Number Of Your Books:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width *0.015),
                                    Expanded(
                                      child: Text(
                                        '${AppCubit.get(context).homeModel!.books!.length}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Created In:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width *0.015),
                                    Expanded(
                                      child: Text( '${AppCubit.get(context).homeModel!.createdAt!.split('T').first}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Updated In:',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(width: size.width *0.015),
                                    Expanded(
                                      child: Text( '${AppCubit.get(context).homeModel!.updatedAt!.split('T').first}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}