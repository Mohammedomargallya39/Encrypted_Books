import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/shared/components/components.dart';
import 'admin_details_photo_screen.dart';

class  AdminProfileScreen extends StatefulWidget {

  AdminProfileScreen ({Key? key}) : super(key: key);

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //AppCubit.get(context).getUserData();
  //   AppCubit.get(context).getUserBooks();
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).homeModel != null ,
          builder: (context) => WillPopScope(
            onWillPop: () async{
              navigateAndEnd(context, AdminDrawerScreen());
              return true;
            },
            child:
            // Scaffold(
            //   floatingActionButton: IconButton(
            //     icon: Icon(Icons.arrow_back_ios),
            //     onPressed: () {
            //       navigateAndEnd(
            //           context,AdminDrawerScreen()
            //       );
            //     },
            //   ),
            //   floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            //   body: BlocConsumer<ThemeCubit,ThemeStates>(
            //     listener: (context, state) {},
            //     builder: (context, state) {
            //       return Container(
            //         width: size.width,
            //         height: size.height,
            //         child: Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             Positioned(
            //               top: 0,
            //               left: 0,
            //               child: Image.asset('assets/images/main_top.png',
            //                 width: size.width * 0.35,),
            //             ),
            //             Positioned(
            //               bottom: 0,
            //               right: 0,
            //               child: Image.asset('assets/images/login_bottom.png',
            //                 width: size.width * 0.4,),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
            //               child: SingleChildScrollView(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children:
            //                   <Widget>
            //                   [
            //                     Center(
            //                       child: GestureDetector(
            //                         child: SizedBox(
            //                           width:  size.width * 0.5,
            //                           height: size.height * 0.21,
            //                           child: Stack(
            //                             alignment: AlignmentDirectional.bottomEnd,
            //                             children:[
            //                               Center(
            //                                 child: CircleAvatar(
            //                                   radius: 111,
            //                                   backgroundImage:  NetworkImage(
            //                                       '${AppCubit.get(context).homeModel!.pic}'
            //                                   ),
            //                                 ),
            //                               ),
            //                             ] ,
            //                           ),
            //                         ),
            //                         onTap: ()
            //                         {
            //                           Navigator.push(context, MaterialPageRoute(builder: (_){
            //                             return const UserDetailsPhotoDetails() ;
            //                           }));
            //                         },
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.02,),
            //                     Center(
            //                       child: Text(
            //                         AppCubit.get(context).homeModel!.email!.split('@').first,
            //                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * 0.055,),),
            //                     ),
            //                     SizedBox(height: size.height * 0.04,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8),
            //                       child: Row(
            //                         children: [
            //                           Text('Name:',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.06,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                           ),
            //                           SizedBox(width: size.width * 0.015,),
            //                           Expanded(
            //                             child: Text(
            //                               '${AppCubit.get(context).homeModel!.name}',
            //                               maxLines: 1,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: size.width * 0.0475,
            //                                   color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Row(
            //                         children: [
            //                           Text('E-mail:',
            //                             style: TextStyle(
            //                                 fontSize: size.width * 0.06,
            //                                 fontWeight: FontWeight.bold),),
            //                           SizedBox(width: size.width *0.015),
            //                           Expanded(
            //                             child: Text(
            //                               '${AppCubit.get(context).homeModel!.email}',
            //                               maxLines: 1,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: size.width * 0.0475,
            //                                   color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800),),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Row(
            //                         children: [
            //                           Text('Phone:',
            //                             style: TextStyle(
            //                                 fontSize: size.width * 0.06,
            //                                 fontWeight: FontWeight.bold),),
            //                           SizedBox(width: size.width *0.015),
            //                           Expanded(
            //                             child: Text(
            //                               '${AppCubit.get(context).homeModel!.phone}',
            //                               maxLines: 1,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: size.width * 0.0475,
            //                                   color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800),),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Row(
            //                         children: [
            //                           Text('Created In:',
            //                             style: TextStyle(
            //                                 fontSize: size.width * 0.06,
            //                                 fontWeight: FontWeight.bold),),
            //                           SizedBox(width: size.width *0.015),
            //                           Expanded(
            //                             child: Text(
            //                               '${AppCubit.get(context).homeModel!.createdAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.createdAt!.substring(11,18)}',
            //                               maxLines: 1,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: size.width * 0.0475,
            //                                   color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800),),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                     SizedBox(height: size.height * 0.01,),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Row(
            //                         children: [
            //                           Text('Updated In:',
            //                             style: TextStyle(
            //                                 fontSize: size.width * 0.06,
            //                                 fontWeight: FontWeight.bold),),
            //                           SizedBox(width: size.width *0.015),
            //                           Expanded(
            //                             child: Text(
            //                               '${AppCubit.get(context).homeModel!.updatedAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.updatedAt!.substring(11,18)}',
            //                               maxLines: 1,
            //                               overflow: TextOverflow.ellipsis,
            //                               style: TextStyle(
            //                                   fontSize: size.width * 0.0475,
            //                                   color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800),),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     const SizedBox(height: 12,),
            //                     Container(
            //                       decoration: const BoxDecoration(
            //                         border: Border(bottom:  BorderSide(color: Colors.grey),),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ProfileScreen(
              containerHeight: size.height,
              containerWidth: size.width,
              positionedWidth: size.width * 0.35,
              gestureDetectorWidth: size.width * 0.5,
              gestureDetectorHeight: size.height * 0.21,
              profileImage: '${AppCubit.get(context).homeModel!.pic}',
              imageOnPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return const AdminDetailsPhotoDetails() ;
                }));
              },
              sizedBoxHeight: size.height * 0.02,
              id: AppCubit.get(context).homeModel!.email!.split('@').first,
              IdFontSize: size.width * 0.05,
              fontSize: size.width * 0.06,
              sizedBoxWidth: size.width * 0.015,
              name: '${AppCubit.get(context).homeModel!.name}',
              cubitFontSize: size.width * 0.0475,
              email: '${AppCubit.get(context).homeModel!.email}',
              phone: '${AppCubit.get(context).homeModel!.phone}',
              numberOfBooks: '${AppCubit.get(context).homeModel!.books!.length}',
              createdIn: '${AppCubit.get(context).homeModel!.createdAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.createdAt!.substring(11,18)}',
              updatedIn: '${AppCubit.get(context).homeModel!.updatedAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.updatedAt!.substring(11,18)}',
              floatingActionButtonOnPressed:()
              {
                navigateAndEnd(context,AdminDrawerScreen());
              } ,
              sizedBoxDataHeight: size.height * 0.01,
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ) ;
      },
    );
  }
}


