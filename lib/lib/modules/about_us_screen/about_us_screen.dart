import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/components/components.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        navigateAndEnd(
            context,
            AppCubit.get(context).userModel!.isAdmin
                ? AdminDrawerScreen()
                : UserDrawerScreen());
        return true;
      },
      child: Scaffold(
        floatingActionButton: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            navigateAndEnd(
                context,
                AppCubit.get(context).userModel!.isAdmin
                    ? AdminDrawerScreen()
                    : UserDrawerScreen());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.topCenter,
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
              ],
            ),
          )
      ),
    );
  }
}
