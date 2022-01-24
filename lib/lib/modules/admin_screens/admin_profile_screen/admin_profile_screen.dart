import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_details_photo_screen.dart';

class  AdminProfileScreen extends StatelessWidget {

  AdminProfileScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null ,
          // && AppCubit.get(context).userBooksNumber != null,
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
                          child: SizedBox(
                            width:  220,
                            height: 235,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:[
                                // Center(
                                //   child: Container(
                                //     margin: const EdgeInsets.all(10),
                                //     width:  275,
                                //     height: 275,
                                //     decoration:   BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: DecorationImage(image:
                                //       NetworkImage(AppCubit.get(context).userModel!.image),
                                //           fit: BoxFit.fill
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Center(
                                  child: CircleAvatar(
                                    radius: 111,
                                    backgroundImage:  NetworkImage(
                                        '${AppCubit.get(context).userModel!.image}'
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
                    ),
                    const SizedBox(height: 33.33,),
                    Center(
                      child: Text(
                        AppCubit.get(context).userModel!.email.split('@').first,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
                    ),
                    const SizedBox(height: 44.4,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Text('Name:',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold),),
                          const SizedBox(width: 8,),
                          Text(
                            '${AppCubit.get(context).userModel!.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('E-mail:',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold),),
                          const SizedBox(width: 8,),
                          Text(
                            '${AppCubit.get(context).userModel!.email}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Phone:',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold),),
                          const SizedBox(width: 8,),
                          Text(
                            '${AppCubit.get(context).userModel!.phone}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,),),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 12,),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     border: Border(bottom:  BorderSide(color: Colors.grey),),
                    //   ),
                    // ),
                    // const SizedBox(height: 12,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       const Text('Number of your books:',
                    //         style: TextStyle(
                    //             fontSize: 33,
                    //             fontWeight: FontWeight.bold),),
                    //       const SizedBox(width: 8,),
                    //       Text( AppCubit.get(context).homeModel!.numberOfBooks as String,
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //           fontSize: 20,),),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 12,),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey),),
                      ),
                    ),
                    // const SizedBox(height: 12,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       const Text('Account created in:',
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //             fontSize: 33,
                    //             fontWeight: FontWeight.bold),),
                    //       const SizedBox(width: 8,),
                    //       Text( AppCubit.get(context).homeModel!.createdIn,
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //           fontSize: 20,),),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 12,),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     border: Border(bottom:  BorderSide(color: Colors.grey),),
                    //   ),
                    // ),
                    // const SizedBox(height: 12,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       const Text('Last update in:',
                    //         style: TextStyle(
                    //             fontSize: 33,
                    //             fontWeight: FontWeight.bold),),
                    //       const SizedBox(width: 8,),
                    //       Text( AppCubit.get(context).homeModel!.updatedIn,
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //           fontSize: 20,),),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 12,),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     border: Border(bottom:  BorderSide(color: Colors.grey),),
                    //   ),
                    // ),
                    //



                    // const SizedBox(height: 12,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       const Text('Number of your books:',
                    //         style: TextStyle(
                    //             fontSize: 33,
                    //             fontWeight: FontWeight.bold),),
                    //       const SizedBox(width: 8,),
                    //       Text(
                    //         AppCubit.get(context).userBooksNumber!.NumOfBooks,
                    //         // '0',
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //           fontSize: 20,),),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 12,),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     border: Border(bottom:  BorderSide(color: Colors.grey),),
                    //   ),
                    // ),
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
