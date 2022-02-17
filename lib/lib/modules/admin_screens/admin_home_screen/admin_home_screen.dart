import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/students_departments.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'cs_books_screens/cs_books_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state){
            return Scaffold(
              // appBar: AppBar(
              //   title: const Text('Encrypted Books'),
              // ),
              // drawer: Drawer(
              //   child: Container(
              //     color:ThemeCubit.get(context).darkTheme ? Colors.grey.shade800: HexColor('#396691'),
              //     //color: HexColor('#396691'),
              //     child: ListView(
              //       children:  <Widget>[
              //         DrawerHeader(
              //           decoration: const BoxDecoration(
              //             gradient: LinearGradient(colors: <Color>
              //             [
              //               Colors.grey,
              //               Colors.blueGrey,
              //             ]),
              //           ),
              //           child: BlocConsumer<AppCubit , AppStates>(
              //             listener: (context, state) {},
              //             builder: (context, state) {
              //               return ConditionalBuilder(
              //                 condition: AppCubit.get(context).userModel != null,
              //                 builder: (context) =>  Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children:  <Widget>[
              //                     Container(
              //                       margin: const EdgeInsets.all(10),
              //                       width: size.width * 0.25,
              //                       height: size.height * 0.25,
              //                       child: GestureDetector(
              //                         child: SizedBox(
              //                           width: size.width * 0.25,
              //                           height: size.height * 0.25,
              //                           child: Stack(
              //                             alignment: AlignmentDirectional.bottomEnd,
              //                             children:[
              //                               Center(
              //                                 child: CircleAvatar(
              //                                   radius: 44,
              //                                   backgroundImage:  NetworkImage(
              //                                       '${AppCubit.get(context).userModel!.image}'
              //                                   ),
              //                                 ),
              //                               ),
              //                             ] ,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     SizedBox(width: size.width * 0.005,),
              //                     Expanded(
              //                       child: Column(
              //                         //crossAxisAlignment: CrossAxisAlignment.center,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           SizedBox(
              //                             width: size.width,
              //                             child: Text(
              //                               ' ${AppCubit.get(context).userModel!.name}',
              //                               maxLines: 1,
              //                               overflow: TextOverflow.ellipsis,
              //                               style: TextStyle(
              //                                   fontWeight: FontWeight.bold ,
              //                                   fontSize: 16 ,
              //                                   color: Colors.white
              //                               ),
              //                             ),
              //                           ),
              //                           SizedBox(height: size.height *0.007,),
              //                           SizedBox(
              //                             width: size.width,
              //                             child: Text(AppCubit.get(context).userModel!.email.split('@').first ,
              //                               maxLines: 1,
              //                               overflow: TextOverflow.ellipsis,
              //                               style: TextStyle(
              //                                   fontWeight: FontWeight.bold ,
              //                                   fontSize: 16 ,
              //                                   color: Colors.white
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 fallback: (context) => Center(child: CircularProgressIndicator()),
              //               );
              //             },
              //           ),
              //         ),
              //         //                 سكرينات ال drawer
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListDarkMode(),
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListHome(),
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListProfile(),
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListSettings(),
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListHelp(),
              //         SizedBox(height: size.height * 0.02,),
              //         const CustomListSignOut(),
              //       ],
              //     ),
              //   ),
              // ),
              body: Container(
                width: double.infinity,
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          // SizedBox(height: size.height * 0.05,),
                          Text('Welcome Admin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/admin.svg',
                            height: size.height * 0.4,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                            child: defaultButton(
                              function: ()
                              {
                                navigateTo(context, StudentsDepartmentsScreen());
                              },
                              text: 'Departments',
                              context: context,
                              height: size.height * 0.08,
                              width: size.width,
                            ),
                            // SizedBox(
                            //   width: size.width ,
                            //   height: size.height * 0.06,
                            //   child: MaterialButton(
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(22),
                            //     ),
                            //     elevation: 5,
                            //     color: defaultColor,
                            //     onPressed: ()
                            //     {
                            //       navigateTo(context, const StudentsScreen());
                            //     },
                            //     child: const Text('Students',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                            child: defaultButton(
                              function: ()
                              {
                                navigateTo(context, const AdminBooksScreen());
                              },
                              text: 'Books',
                              context: context,
                              height: size.height * 0.08,
                              width: size.width,
                            ),
                            // SizedBox(
                            //   width: size.width ,
                            //   height: size.height * 0.06,
                            //   child: MaterialButton(
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(22.0),
                            //     ),
                            //     elevation: 5,
                            //     color: defaultColor,
                            //     onPressed: ()
                            //     {
                            //       navigateTo(context, const AdminBooksScreen());
                            //     },
                            //     child: const Text('Books',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },

    );
  }
}
// محتاج يتعدل لسه.....................
// class CustomListDarkMode extends StatelessWidget{
//
//   const CustomListDarkMode({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.grey ))
//         ),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.brightness_4_outlined,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025,),
//                 Text('Dark Mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             ThemeCubit.get(context).changeTheme();
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomListHome extends StatelessWidget{
//   const CustomListHome({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.home,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025),
//                 Text('Home', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white
//                 ),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             // navigateTo(context, EncryptionLayout());
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomListProfile extends StatelessWidget{
//   const CustomListProfile({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0,12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.person,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025),
//                 Text('Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white
//                 ),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             navigateTo(context, AdminProfileScreen());
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomListSettings extends StatelessWidget{
//   const CustomListSettings({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children:  <Widget>[
//                 Icon(Icons.settings,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025),
//                 Text('Settings', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white
//                 ),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             navigateTo(context, UserSettingsScreen());
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomListHelp extends StatelessWidget{
//   const CustomListHelp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.help,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025),
//                 Text('Help', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white
//                 ),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             navigateTo(context, const UserHelpScreen());
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomListSignOut extends StatelessWidget{
//   const CustomListSignOut({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 12),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: SizedBox(
//             height: size.height * 0.035,
//             child: Row(
//               children:  <Widget>[
//                 Icon(Icons.logout,color: Colors.white
//                 ),
//                 SizedBox(width: size.width *0.025),
//                 Text('Sign Out', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           onTap: ()
//           {
//             showDialog(context: context,
//               builder: (context) => SignOutAlertDialog
//                 (
//                   title: 'Sign Out',
//                   description: 'Are you sure?'
//               )
//               ,);
//             },
//         ),
//       ),
//     );
//   }
// }
