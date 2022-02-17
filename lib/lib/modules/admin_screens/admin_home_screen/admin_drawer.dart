// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social/lib/cubit/cubit.dart';
// import 'package:social/lib/cubit/states.dart';
// import 'package:social/lib/modules/admin_screens/admin_profile_screen/admin_profile_screen.dart';
// import 'package:social/lib/modules/help_screen/user_help_screen.dart';
// import 'package:social/lib/modules/settings_screen/user_settings_screen.dart';
// import 'package:social/lib/modules/user_screens/user_home_screen/user_home_screen.dart';
// import 'package:social/lib/modules/user_screens/user_profile_screen/user_profile_screen.dart';
// import 'package:social/lib/shared/components/components.dart';
// import 'package:social/lib/shared/cubit/cubit.dart';
// import 'package:social/lib/shared/cubit/states.dart';
//
// import 'admin_home_screen.dart';
//
// class AdminDrawerScreen extends StatefulWidget {
//   const AdminDrawerScreen({Key? key}) : super(key: key);
//
//   @override
//   __AdminDrawerScreenPage createState() => __AdminDrawerScreenPage();
// }
//
// class __AdminDrawerScreenPage extends State<AdminDrawerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const AnimatedDrawerScreen();
//   }
// }
//
// class AnimatedDrawerScreen extends StatefulWidget {
//   const AnimatedDrawerScreen({Key? key}) : super(key: key);
//
//   @override
//   _AnimatedDrawerState createState() => _AnimatedDrawerState();
// }
//
// class _AnimatedDrawerState extends State<AnimatedDrawerScreen> {
//   dynamic screenView;
//   late DrawerIndex drawerIndex;
//   late AnimationController sliderAnimationController;
//   @override
//   void initState() {
//     drawerIndex = DrawerIndex.HOME;
//
//     /// first  Item in drawer
//     screenView = UserHomeScreen();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.blue,
//       child: SafeArea(
//         top: false,
//         bottom: false,
//         child: Scaffold(
//           // drawerScrimColor: Colors.blue,
//           body: DrawerUserController(
//
//             screenIndex: drawerIndex,
//             drawerWidth: MediaQuery.of(context).size.width * 0.75,
//             animationController: (AnimationController animationController) {
//               sliderAnimationController = animationController;
//             },
//             onDrawerCall: (DrawerIndex drawerIndexdata) {
//               changeIndex(drawerIndexdata);
//             },
//             screenView: screenView,
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// changing current item in drawer
//
//   void changeIndex(DrawerIndex drawerIndexdata) {
//     if (drawerIndex != drawerIndexdata) {
//       drawerIndex = drawerIndexdata;
//       if (drawerIndex == DrawerIndex.HOME) {
//         setState(() {
//           screenView = AdminHomeScreen();
//         });
//       } else if (drawerIndex == DrawerIndex.Profile) {
//         setState(() {
//           screenView = AdminProfileScreen();
//         });
//       } else if (drawerIndex == DrawerIndex.Settings) {
//         setState(() {
//           screenView = UserSettingsScreen();
//         });
//       } else if (drawerIndex == DrawerIndex.Help) {
//         setState(() {
//           screenView = UserHelpScreen();
//         });
//       } else {
//         Navigator.of(context).pop();
//       }
//     }
//   }
// }
//
// /// Item in drawer
//
// class Page extends StatelessWidget {
//   //final String content;
//
//   const Page({Key? key,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AdminHomeScreen();
//   }
// }
//
// /// Item in drawer
// class HomeDrawer extends StatefulWidget {
//   const HomeDrawer(
//       {Key? key,
//         required this.screenIndex,
//         required this.iconAnimationController,
//         required this.callBackIndex})
//       : super(key: key);
//
//   final AnimationController iconAnimationController;
//   final DrawerIndex screenIndex;
//   final Function(DrawerIndex) callBackIndex;
//
//   @override
//   _HomeDrawerState createState() => _HomeDrawerState();
// }
//
// class _HomeDrawerState extends State<HomeDrawer> {
//   List<DrawerList> drawerList = [];
//
//   @override
//   void initState() {
//     setdDrawerListArray();
//     super.initState();
//   }
//
//   /// Inilize Items list in drawer
//
//   void setdDrawerListArray() {
//     drawerList = <DrawerList>[
//       DrawerList(
//         index: DrawerIndex.HOME,
//         labelName: 'Home',
//         icon: const Icon(Icons.home),
//       ),
//       DrawerList(
//         index: DrawerIndex.Profile,
//         labelName: 'Profile',
//         icon: const Icon(Icons.person),
//       ),
//       DrawerList(
//         index: DrawerIndex.Settings,
//         labelName: 'Settings',
//         icon: const Icon(Icons.settings),
//       ),
//       DrawerList(
//         index: DrawerIndex.Help,
//         labelName: 'Help',
//         icon: const Icon(Icons.help),
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BlocConsumer<AppCubit,AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return ConditionalBuilder(
//           condition: AppCubit.get(context).userModel != null,
//           builder: (context) => BlocConsumer<ThemeCubit,ThemeStates>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               return Scaffold(
//
//                 backgroundColor: ThemeCubit.get(context).darkTheme ? Colors.grey.shade900:Colors.blue,
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             /// ---------------------------
//                             /// Animated Builder for drawer
//                             /// ---------------------------
//
//                             AnimatedBuilder(
//                               animation: widget.iconAnimationController,
//                               builder: (BuildContext context, Widget? child) {
//                                 return ScaleTransition(
//
//                                   scale: AlwaysStoppedAnimation<double>(
//                                       1.0 - (widget.iconAnimationController.value) * 0.2),
//                                   child: RotationTransition(
//                                     turns: AlwaysStoppedAnimation<double>(Tween<double>(
//                                         begin: 0.0, end: 24.0)
//                                         .animate(CurvedAnimation(
//                                         parent: widget.iconAnimationController,
//                                         curve: Curves.fastOutSlowIn))
//                                         .value /
//                                         360),
//                                     child: Container(
//                                         height: size.height * 0.15,
//                                         width: size.width ,
//                                         child: GestureDetector(
//                                           child: SizedBox(
//                                             width: size.width * 0.25,
//                                             height: size.height * 0.25,
//                                             child: Stack(
//                                               alignment: AlignmentDirectional.centerStart,
//                                               children:[
//                                                 CircleAvatar(
//                                                   radius: 50,
//                                                   backgroundImage:  NetworkImage(
//                                                       '${AppCubit.get(context).userModel!.image}'
//                                                   ),
//                                                 ),
//                                               ] ,
//                                             ),
//                                           ),
//                                         )
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(13, 0, 7, 7),
//                               child: BlocConsumer<ThemeCubit,ThemeStates>(
//                                 listener: (context, state) {},
//                                 builder: (context, state) {
//                                   return Stack(
//                                     alignment: AlignmentDirectional.centerStart,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Text(
//                                             ' ${AppCubit.get(context).userModel!.email.split('@').first}',
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold ,
//                                                 fontSize: 16 ,
//                                                 color: Colors.white
//                                             ),
//                                           ),
//                                           Spacer(),
//                                           Padding(
//                                             padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
//                                             child: InkWell(
//                                               child: Icon(Icons.brightness_4_outlined,color: Colors.white
//                                               ),
//                                               onTap: ()
//                                               {
//                                                 ThemeCubit.get(context).changeTheme();
//                                               },
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                      SizedBox(
//                       height: size.height * .001,
//                     ),
//                     Divider(
//                       height: size.height * .002,
//                       color: Colors.white.withOpacity(0.6),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         padding: const EdgeInsets.all(0.0),
//                         itemCount: drawerList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return inkwell(drawerList[index]);
//                         },
//                       ),
//                     ),
//                     Divider(
//                       height: size.height * .002,
//                       color: Colors.white.withOpacity(0.6),
//                     ),
//                     Column(
//                       children: <Widget>[
//                         ListTile(
//                           title: Text(
//                             'Sign Out',
//                             style: TextStyle(
//                               fontFamily: 'Bahij Janna',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Colors.red,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                           trailing: const Icon(
//                             Icons.logout,
//                             color: Colors.red,
//                           ),
//                           onTap: ()
//                           {
//                             showDialog(context: context,
//                               builder: (context) => SignOutAlertDialog
//                                 (
//                                   title: 'Sign Out',
//                                   description: 'Are you sure?'
//                               )
//                               ,);
//                           },
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).padding.bottom,
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           fallback: (context) => Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
//
//   Widget inkwell(DrawerList listData) {
//     Size size = MediaQuery.of(context).size;
//     return BlocConsumer<ThemeCubit,ThemeStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Material(
//           color: ThemeCubit.get(context).darkTheme ? Colors.grey.shade900:Colors.blue,
//           child: InkWell(
//             //splashColor: Colors.grey.withOpacity(0.1),
//             //highlightColor: Colors.blue,
//             onTap: () {
//               navigationtoScreen(listData.index);
//             },
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         width: size.width * 0.02 ,
//                         height: size.height * 0.048,
//                         decoration: BoxDecoration(
//                           color: widget.screenIndex == listData.index
//                               ? Colors.white
//                               : Colors.transparent,
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(0),
//                             topRight: Radius.circular(16),
//                             bottomLeft: Radius.circular(0),
//                             bottomRight: Radius.circular(16),
//                           ),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(4.0),
//                       ),
//                       listData.isAssetsImage!
//                           ? SizedBox(
//                         width: size.width * 0.05,
//                         height: size.height * 0.05,
//                         child: Image.asset(
//                           listData.imageName,
//                           // color: widget.screenIndex == listData.index
//                           //     ? Colors.blue
//                           //     : Colors.purple.withOpacity(0.6),
//                         ),
//                       )
//                           : Icon(
//                         listData.icon.icon,
//                         color: ThemeCubit.get(context).darkTheme
//                             ?
//                         widget.screenIndex == listData.index
//                             ? Colors.grey
//                             : Colors.white :
//                         widget.screenIndex == listData.index
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//
//                       const Padding(
//                         padding: EdgeInsets.all(4.0),
//                       ),
//                       Text(
//                         listData.labelName,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                           color: ThemeCubit.get(context).darkTheme
//                               ?
//                           widget.screenIndex == listData.index
//                               ? Colors.grey
//                               : Colors.white :
//                           widget.screenIndex == listData.index
//                               ? Colors.white
//                               : Colors.black,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ],
//                   ),
//                 ),
//                 widget.screenIndex == listData.index
//                     ? AnimatedBuilder(
//                   animation: widget.iconAnimationController,
//                   builder: (BuildContext context, Widget? child) {
//                     return Transform(
//                       transform: Matrix4.translationValues(
//                           (MediaQuery.of(context).size.width * 0.75 - 64) *
//                               (1.0 -
//                                   widget.iconAnimationController.value -
//                                   1.0),
//                           0.0,
//                           0.0),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 8, bottom: 8),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.75 - 64,
//                           height: size.width * 0.05,
//                           decoration: BoxDecoration(
//                             color:ThemeCubit.get(context).darkTheme ? Colors.white.withOpacity(0.1): Colors.black.withOpacity(0.1),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(0),
//                               topRight: Radius.circular(28),
//                               bottomLeft: Radius.circular(0),
//                               bottomRight: Radius.circular(28),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//                     : const SizedBox()
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
//     widget.callBackIndex(indexScreen);
//   }
// }
//
// enum DrawerIndex {
//   // ignore: constant_identifier_names
//   HOME,
//   // ignore: constant_identifier_names
//   Settings,
//   // ignore: constant_identifier_names
//   Profile,
//   // ignore: constant_identifier_names
//   Help,
//   // ignore: constant_identifier_names
//   About,
// }
//
// class DrawerList {
//   DrawerList({
//     this.isAssetsImage = false,
//     this.labelName = '',
//     required this.icon,
//     required this.index,
//     this.imageName = '',
//   });
//
//   String labelName;
//   Icon icon;
//   bool? isAssetsImage;
//   String imageName;
//   DrawerIndex index;
// }
//
// class DrawerUserController extends StatefulWidget {
//   const DrawerUserController({
//     Key? key,
//     this.drawerWidth = 250,
//     required this.onDrawerCall,
//     this.screenView,
//     required this.animationController,
//     this.animatedIconData = AnimatedIcons.arrow_menu,
//     this.menuView,
//     this.drawerIsOpen,
//     required this.screenIndex,
//   }) : super(key: key);
//
//   final double drawerWidth;
//   final Function(DrawerIndex) onDrawerCall;
//   final Widget? screenView;
//   final Function(AnimationController) animationController;
//   final Function(bool)? drawerIsOpen;
//   final AnimatedIconData animatedIconData;
//   final Widget? menuView;
//   final DrawerIndex screenIndex;
//
//   @override
//   _DrawerUserControllerState createState() => _DrawerUserControllerState();
// }
//
// class _DrawerUserControllerState extends State<DrawerUserController>
//     with TickerProviderStateMixin {
//   late ScrollController scrollController;
//   late AnimationController iconAnimationController;
//   late AnimationController animationController;
//
//   double scrolloffset = 0.0;
//   bool isSetDawer = false;
//
//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//
//     iconAnimationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 0));
//
//     iconAnimationController.animateTo(1.0,
//         duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
//
//     scrollController =
//         ScrollController(initialScrollOffset: widget.drawerWidth);
//
//     scrollController
//         .addListener(() {
//       if (scrollController.offset <= 0) {
//         if (scrolloffset != 1.0) {
//           setState(() {
//             scrolloffset = 1.0;
//             try {
//               widget.drawerIsOpen!(true);
//             } catch (_) {}
//           });
//         }
//
//         iconAnimationController.animateTo(0.0,
//             duration: const Duration(milliseconds: 0), curve: Curves.linear);
//       } else if (scrollController.offset > 0 &&
//           scrollController.offset < widget.drawerWidth) {
//         iconAnimationController.animateTo(
//             (scrollController.offset * 100 / (widget.drawerWidth)) / 100,
//             duration: const Duration(milliseconds: 0),
//             curve: Curves.linear);
//       } else if (scrollController.offset <= widget.drawerWidth) {
//         if (scrolloffset != 0.0) {
//           setState(() {
//             scrolloffset = 0.0;
//             try {
//               widget.drawerIsOpen!(false);
//             } catch (_) {}
//           });
//         }
//
//         iconAnimationController.animateTo(1.0,
//             duration: const Duration(milliseconds: 0), curve: Curves.linear);
//       }
//     });
//
//     getInitState();
//
//     super.initState();
//   }
//
//   Future<bool> getInitState() async {
//     await Future<dynamic>.delayed(const Duration(milliseconds: 300));
//     try {
//       widget.animationController(iconAnimationController);
//     } catch (_) {}
//
//     await Future<dynamic>.delayed(const Duration(milliseconds: 100));
//     scrollController.jumpTo(
//       widget.drawerWidth,
//     );
//
//     setState(() {
//       isSetDawer = true;
//     });
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.blue,
//       body: SingleChildScrollView(
//         controller: scrollController,
//         scrollDirection: Axis.horizontal,
//         physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
//         child: Opacity(
//           opacity: isSetDawer ? 1 : 0,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width + widget.drawerWidth,
//             child: Container(
//               // color: defaultColor,
//               child: Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: widget.drawerWidth,
//                     height: MediaQuery.of(context).size.height,
//                     child: AnimatedBuilder(
//                       animation: iconAnimationController,
//                       builder: (BuildContext context, Widget? child) {
//                         return Transform(
//                           transform: Matrix4.translationValues(
//                               scrollController.offset, 0.0, 0.0),
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height,
//                             width: widget.drawerWidth,
//                             child: HomeDrawer(
//                               screenIndex: widget.screenIndex,
//                               iconAnimationController: iconAnimationController,
//                               callBackIndex: (DrawerIndex indexType) {
//                                 onDrawerClick();
//                                 try {
//                                   widget.onDrawerCall(indexType);
//                                   // ignore: empty_catches
//                                 } catch (e) {}
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: Stack(
//                       children: <Widget>[
//                         IgnorePointer(
//                           ignoring: scrolloffset == 1 || false,
//                           child: widget.screenView ?? Container(
//                             //  color: Colors.white,
//                           ),
//                         ),
//                         scrolloffset == 1.0
//                             ? InkWell(
//                           onTap: () {
//                             onDrawerClick();
//                           },
//                         )
//                             : const SizedBox(),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               top: MediaQuery.of(context).padding.top + 8,
//                               left: 8),
//                           child: SizedBox(
//                             width: AppBar().preferredSize.height - 8,
//                             height: AppBar().preferredSize.height - 8,
//                             child: Material(
//                               color: Colors.transparent,
//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(
//                                     AppBar().preferredSize.height),
//                                 child: Center(
//                                   child: widget.menuView ?? AnimatedIcon(
//                                       icon: widget.animatedIconData,
//                                       progress:
//                                       iconAnimationController),
//                                 ),
//                                 onTap: () {
//                                   FocusScope.of(context)
//                                       .requestFocus(FocusNode());
//                                   onDrawerClick();
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onDrawerClick() {
//     if (scrollController.offset != 0.0) {
//       scrollController.animateTo(
//         0.0,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.fastOutSlowIn,
//       );
//     } else {
//       scrollController.animateTo(
//         widget.drawerWidth,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.fastOutSlowIn,
//       );
//     }
//   }
// }
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_profile_screen/admin_profile_screen.dart';
import 'package:social/lib/modules/help_screen/user_help_screen.dart';
import 'package:social/lib/modules/settings_screen/user_settings_screen.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_home_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';

import 'admin_home_screen.dart';

class AdminDrawerScreen extends StatefulWidget {
  const AdminDrawerScreen({Key? key}) : super(key: key);

  @override
  __AdminDrawerScreenPage createState() => __AdminDrawerScreenPage();
}

class __AdminDrawerScreenPage extends State<AdminDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedDrawerScreen();
  }
}

class AnimatedDrawerScreen extends StatefulWidget {
  const AnimatedDrawerScreen({Key? key}) : super(key: key);

  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawerScreen> {
  dynamic screenView;
  late DrawerIndex drawerIndex;
  late AnimationController sliderAnimationController;
  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;

    /// first  Item in drawer
    screenView = AdminHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  /// changing current item in drawer

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = AdminHomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = AdminProfileScreen();
        });
      } else if (drawerIndex == DrawerIndex.Settings) {
        setState(() {
          screenView = UserSettingsScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = UserHelpScreen();
        });
      } else {
        Navigator.of(context).pop();
      }
    }
  }
}

/// Item in drawer

class Page extends StatelessWidget {
  //final String content;

  const Page({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminHomeScreen();
  }
}

/// Item in drawer
class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key? key,
         required this.screenIndex,
        required this.iconAnimationController,
        required this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList> drawerList = [];

  @override
  void initState() {
    setdDrawerListArray();
    super.initState();
  }

  /// Inilize Items list in drawer

  void setdDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: 'Home',
        icon: const Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.Profile,
        labelName: 'Profile',
        icon: const Icon(Icons.person),
      ),
      DrawerList(
        index: DrawerIndex.Settings,
        labelName: 'Settings',
        icon: const Icon(Icons.settings),
      ),
      DrawerList(
        index: DrawerIndex.Help,
        labelName: 'Help',
        icon: const Icon(Icons.help),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => BlocConsumer<ThemeCubit,ThemeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                top: true,
                bottom: true,
                child: Scaffold(

                  backgroundColor: ThemeCubit.get(context).darkTheme ? Colors.grey.shade900:Colors.blue,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              /// ---------------------------
                              /// Animated Builder for drawer
                              /// ---------------------------

                              AnimatedBuilder(
                                animation: widget.iconAnimationController,
                                builder: (BuildContext context, Widget? child) {
                                  return ScaleTransition(

                                    scale: AlwaysStoppedAnimation<double>(
                                        1.0 - (widget.iconAnimationController.value) * 0.2),
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation<double>(Tween<double>(
                                          begin: 0.0, end: 24.0)
                                          .animate(CurvedAnimation(
                                          parent: widget.iconAnimationController,
                                          curve: Curves.fastOutSlowIn))
                                          .value /
                                          360),
                                      child: Container(
                                          height: size.height * 0.11,
                                          width: size.width ,
                                          child: GestureDetector(
                                            child: SizedBox(
                                              width: size.width * 0.25,
                                              height: size.height * 0.25,
                                              child: Stack(
                                                alignment: AlignmentDirectional.centerStart,
                                                children:[
                                                  CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage:  NetworkImage(
                                                        '${AppCubit.get(context).userModel!.image}'
                                                    ),
                                                  ),
                                                ] ,
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(13, 7, 7, 7),
                                child: BlocConsumer<ThemeCubit,ThemeStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return Stack(
                                      alignment: AlignmentDirectional.centerStart,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ' ${AppCubit.get(context).userModel!.email.split('@').first}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold ,
                                                  fontSize: 16 ,
                                                  color: Colors.white
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                              child: InkWell(
                                                child: Icon(Icons.brightness_4_outlined,color: Colors.white
                                                ),
                                                onTap: ()
                                                {
                                                  ThemeCubit.get(context).changeTheme();
                                                },
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.001,
                      ),
                      Divider(
                        height: size.height * 0.002,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(0.0),
                          itemCount: drawerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return inkwell(drawerList[index]);
                          },
                        ),
                      ),
                      Divider(
                        height: size.height * 0.002,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Sign Out',
                              style: TextStyle(
                                fontFamily: 'Bahij Janna',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            trailing: const Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            onTap: ()
                            {
                              showDialog(context: context,
                                builder: (context) => SignOutAlertDialog
                                  (
                                    title: 'Sign Out',
                                    description: 'Are you sure?'
                                )
                                ,);
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget inkwell(DrawerList listData) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ThemeCubit,ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Material(
          color: ThemeCubit.get(context).darkTheme ? Colors.grey.shade900:Colors.blue,
          child: InkWell(
            //splashColor: Colors.grey.withOpacity(0.1),
            //highlightColor: Colors.blue,
            onTap: () {
              navigationtoScreen(listData.index);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.02 ,
                        height: size.height * 0.048,
                        decoration: BoxDecoration(
                          color: widget.screenIndex == listData.index
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      listData.isAssetsImage!
                          ? SizedBox(
                        width: size.width * 0.05,
                        height: size.width * 0.05,
                        child: Image.asset(
                          listData.imageName,
                          // color: widget.screenIndex == listData.index
                          //     ? Colors.blue
                          //     : Colors.purple.withOpacity(0.6),
                        ),
                      )
                          : Icon(
                        listData.icon.icon,
                        color: ThemeCubit.get(context).darkTheme
                            ?
                        widget.screenIndex == listData.index
                            ? Colors.grey
                            : Colors.white :
                        widget.screenIndex == listData.index
                            ? Colors.white
                            : Colors.black,
                      ),

                      const Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      Expanded(
                        child: Text(
                          listData.labelName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ThemeCubit.get(context).darkTheme
                                ?
                            widget.screenIndex == listData.index
                                ? Colors.grey
                                : Colors.white :
                            widget.screenIndex == listData.index
                                ? Colors.white
                                : Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                widget.screenIndex == listData.index
                    ? AnimatedBuilder(
                  animation: widget.iconAnimationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          (MediaQuery.of(context).size.width * 0.75 - 64) *
                              (1.0 -
                                  widget.iconAnimationController.value -
                                  1.0),
                          0.0,
                          0.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * 0.75 - 64,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color:ThemeCubit.get(context).darkTheme ? Colors.white.withOpacity(0.1): Colors.black.withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(28),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(28),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

enum DrawerIndex {
  // ignore: constant_identifier_names
  HOME,
  // ignore: constant_identifier_names
  Settings,
  // ignore: constant_identifier_names
  Profile,
  // ignore: constant_identifier_names
  Help,
  // ignore: constant_identifier_names
  About,
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    required this.icon,
    required this.index,
    this.imageName = '',
  });

  String labelName;
  Icon icon;
  bool? isAssetsImage;
  String imageName;
  DrawerIndex index;
}

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    Key? key,
    this.drawerWidth = 250,
    required this.onDrawerCall,
    this.screenView,
    required this.animationController,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuView,
    this.drawerIsOpen,
    required this.screenIndex,
  }) : super(key: key);

  final double drawerWidth;
  final Function(DrawerIndex) onDrawerCall;
  final Widget? screenView;
  final Function(AnimationController) animationController;
  final Function(bool)? drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget? menuView;
  final DrawerIndex screenIndex;

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}
class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController iconAnimationController;
  late AnimationController animationController;
  double scrolloffset = 0.0;
  bool isSetDawer = false;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));

    iconAnimationController.animateTo(1.0,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);

    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);

    scrollController
        .addListener(() {
      if (scrollController.offset <= 0) {
        if (scrolloffset != 1.0) {
          setState(() {
            scrolloffset = 1.0;
            try {
              widget.drawerIsOpen!(true);
            } catch (_) {}
          });
        }

        iconAnimationController.animateTo(0.0,
            duration: const Duration(milliseconds: 0), curve: Curves.linear);
      } else if (scrollController.offset > 0 &&
          scrollController.offset < widget.drawerWidth) {
        iconAnimationController.animateTo(
            (scrollController.offset * 100 / (widget.drawerWidth)) / 100,
            duration: const Duration(milliseconds: 0),
            curve: Curves.linear);
      } else if (scrollController.offset <= widget.drawerWidth) {
        if (scrolloffset != 0.0) {
          setState(() {
            scrolloffset = 0.0;
            try {
              widget.drawerIsOpen!(false);
            } catch (_) {}
          });
        }

        iconAnimationController.animateTo(1.0,
            duration: const Duration(milliseconds: 0), curve: Curves.linear);
      }
    });

    getInitState();

    super.initState();
  }
  Future<bool> getInitState() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 300));
    try {
      widget.animationController(iconAnimationController);
    } catch (_) {}

    await Future<dynamic>.delayed(const Duration(milliseconds: 100));
    scrollController.jumpTo(
      widget.drawerWidth,
    );

    setState(() {
      isSetDawer = true;
    });
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
            child: Opacity(
              opacity: isSetDawer ? 1 : 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width + widget.drawerWidth,
                child: Container(
                  // color: defaultColor,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: widget.drawerWidth,
                        height: MediaQuery.of(context).size.height,
                        child: AnimatedBuilder(
                          animation: iconAnimationController,
                          builder: (BuildContext context, Widget? child) {
                            return Transform(
                              transform: Matrix4.translationValues(
                                  scrollController.offset, 0.0, 0.0),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: widget.drawerWidth,
                                child: HomeDrawer(
                                  screenIndex: widget.screenIndex,
                                  iconAnimationController: iconAnimationController,
                                  callBackIndex: (DrawerIndex indexType) {
                                    onDrawerClick();
                                    try {
                                      widget.onDrawerCall(indexType);
                                      // ignore: empty_catches
                                    } catch (e) {}
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: <Widget>[
                            IgnorePointer(
                              ignoring: scrolloffset == 1 || false,
                              child: widget.screenView ?? Container(
                                //  color: Colors.white,
                              ),
                            ),
                            scrolloffset == 1.0
                                ? InkWell(
                              onTap: () {
                                onDrawerClick();
                              },
                            )
                                : const SizedBox(),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top + 8,
                                  left: 8),
                              child: SizedBox(
                                width: AppBar().preferredSize.height - 8,
                                height: AppBar().preferredSize.height - 8,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(
                                        AppBar().preferredSize.height),
                                    child: Center(
                                      child: widget.menuView ?? AnimatedIcon(
                                          icon: widget.animatedIconData,
                                          progress:
                                          iconAnimationController),
                                    ),
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      onDrawerClick();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void onDrawerClick() {
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
