import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_help_screen/user_help_screen.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_profile_screen.dart';
import 'package:social/lib/modules/user_screens/user_settings_screen/user_settings_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'books/user_online_books_screen.dart';
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context , state){},
      builder: (BuildContext context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Encrypted Books'),
          ),
          drawer: Drawer(
            child: Container(
              color:ThemeCubit.get(context).darkTheme ? Colors.grey.shade800: HexColor('#396691'),
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
                    child: BlocConsumer<AppCubit,AppStates>(
                      listener: (context,state){},
                      builder: (context,state)
                      {
                        return  ConditionalBuilder(
                          condition: AppCubit.get(context).userModel != null,
                                     //                &&
                                     // AppCubit.get(context).homeModel != null,
                          builder: (context) => Row(
                            children:  <Widget>[
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 85.45,
                                height: 85.45,
                                child: GestureDetector(
                                  child: SizedBox(
                                    width:  85.45,
                                    height: 85.45,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children:[
                                        Center(
                                          child: CircleAvatar(
                                            radius: 44,
                                            backgroundImage:  NetworkImage(
                                                '${AppCubit.get(context).userModel!.image}'
                                            ),
                                          ),
                                        ),
                                      ] ,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7.5,),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150.0,
                                    child: Text(
                                     ' ${AppCubit.get(context).userModel!.name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 22.22 ,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    width: 150.0,
                                    child: Text(AppCubit.get(context).userModel!.email.split('@').first ,
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
          body: SingleChildScrollView(
            child: Column(
              children:
              [
                const Image(
                  image: AssetImage("assets/images/lockedbooks.png"),
                  width: 400.0,
                  height: 400.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SizedBox(
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
                        navigateTo(context, const UserOnlineBooksScreen());
                      },
                      child: const Text('Your Books',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
            border: Border(bottom: BorderSide(color: Colors.grey))
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
            navigateTo(context,  UserProfileScreen());
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
          }
          ,
        ),
      ),
    );
  }
}




