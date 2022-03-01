import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class UserHelpScreen extends StatelessWidget {
  const UserHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                  navigateTo(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(17.5,200,17.5,55),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          <Widget>
                          [
                            SizedBox(
                              width: size.width,
                              child:
                              Text('If you have any issue while using our app, you have to contact us by sending a mail to us to solve this problem at top speed. ',
                                maxLines: 22,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,),),
                            ),
                            SizedBox(height: size.height * 0.02,),
                            defaultTextButton(
                              onPressed: ()
                              {
                                launch('mailto:mohammed.gallya39@gmail.com?'
                                    'subject=This is Subject title'
                                    'body = This is Body Email');
                              },
                              text: 'Connect Us',
                              fontSize: size.width * 0.044,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}
