import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/students_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_profile_screen/admin_profile_screen.dart';
import 'package:social/lib/modules/user_screens/user_help_screen/user_help_screen.dart';
import 'package:social/lib/modules/user_screens/user_settings_screen/user_settings_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'admin_books_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Encrypted Books'),
          ),
          drawer: Drawer(
            child: Container(
              color:ThemeCubit.get(context).darkTheme ? Colors.grey.shade800: HexColor('#396691'),
              //color: HexColor('#396691'),
              child: ListView(
                children:  <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>
                      [
                        Colors.grey,
                        Colors.blueGrey,
                      ]),
                    ),
                    child: BlocConsumer<AppCubit , AppStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: AppCubit.get(context).userModel != null,
                          builder: (context) =>  Row(
                            children:  <Widget>[
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 85.45,
                                height: 85.45,
                                decoration:   BoxDecoration(shape: BoxShape.circle,
                                  image:
                                  DecorationImage(image:
                                  NetworkImage(
                                     '${AppCubit.get(context).userModel!.image}'
                                  ),
                                      fit: BoxFit.fill
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7.5,),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  SizedBox(
                                    width: 150.0,
                                    child: Text(
                                      '${AppCubit.get(context).userModel!.name}' ,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 22.22 ,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  SizedBox(
                                    width: 150.0,
                                    child: Text(
                                      AppCubit.get(context).userModel!.email.split('@').first ,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 22.22 ,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
                  //                 سكرينات ال drawer
                  const SizedBox(height: 11.11,),
                  const CustomListDarkMode(),
                  const SizedBox(height: 22.22,),
                  const CustomListHome(),
                  const SizedBox(height: 22.22,),
                  const CustomListProfile(),
                  const SizedBox(height: 22.22,),
                  const CustomListSettings(),
                  const SizedBox(height: 22.22,),
                  const CustomListHelp(),
                  const SizedBox(height: 22.22,),
                  //const CustomListRateUs(),
                  //const SizedBox(height: 22.22,),
                  const CustomListSignOut(),
                ],
              ),
            ),
          ),
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
                      //SizedBox(height: size.height * 0.3,),
                      SvgPicture.asset('assets/icons/admin.svg',
                      height: size.height * 0.5,),
                      //SizedBox(height: size.height * 0.3,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            elevation: 17.5,
                            color: defaultColor,
                            onPressed: ()
                            {
                              navigateTo(context, const StudentsScreen());
                            },
                            child: const Text('Students',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: size.height * 0.3,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            elevation: 17.5,
                            color: defaultColor,
                            onPressed: ()
                            {
                              navigateTo(context, const AdminBooksScreen());
                            },
                            child: const Text('Books',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
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
        );
      },
    );
  }
}
// محتاج يتعدل لسه.....................
class CustomListDarkMode extends StatelessWidget{
  const CustomListDarkMode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey ))
        ),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 33.33,
            child: Row(
              children: const <Widget>[
                Icon(Icons.brightness_4_outlined,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Dark Mode', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
              ],
            ),
          ),
          onTap: ()
          {
            ThemeCubit.get(context).changeTheme();
          },
        ),
      ),
    );
  }
}
class CustomListHome extends StatelessWidget{
  const CustomListHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom:  BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 44.44,
            child: Row(
              children: const <Widget>[
                Icon(Icons.home,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Home', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white
                ),
              ],
            ),
          ),
          onTap: ()
          {
            // navigateTo(context, EncryptionLayout());
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
class CustomListProfile extends StatelessWidget{
  const CustomListProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom:  BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 44.44,
            child: Row(
              children: const <Widget>[
                Icon(Icons.person,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Profile', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white
                ),
              ],
            ),
          ),
          onTap: ()
          {
            navigateTo(context, AdminProfileScreen());
          },
        ),
      ),
    );
  }
}
class CustomListSettings extends StatelessWidget{
  const CustomListSettings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom:  BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 44.44,
            child: Row(
              children: const <Widget>[
                Icon(Icons.settings,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Settings', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white
                ),
              ],
            ),
          ),
          onTap: ()
          {
            navigateTo(context, UserSettingsScreen());
          },
        ),
      ),
    );
  }
}
class CustomListHelp extends StatelessWidget{
  const CustomListHelp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom:  BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 44.44,
            child: Row(
              children: const <Widget>[
                Icon(Icons.help,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Help', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white
                ),
              ],
            ),
          ),
          onTap: ()
          {
            navigateTo(context, const UserHelpScreen());
          },
        ),
      ),
    );
  }
}
class CustomListSignOut extends StatelessWidget{
  const CustomListSignOut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom:  BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: defaultColor,
          child: SizedBox(
            height: 44.44,
            child: Row(
              children:  const <Widget>[
                Icon(Icons.logout,color: Colors.white
                ),
                SizedBox(width: 10.0,),
                Text('Sign Out', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,color: Colors.white,
                ),
              ],
            ),
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
      ),
    );
  }
}
