import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/user_screens/user_help_screen/user_help_screen.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_profile_screen.dart';
import 'package:social/lib/modules/user_screens/user_settings_screen/user_settings_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'books/user_online_books_screen.dart';
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);



   @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Encrypted Books'),
          ),
          drawer: Drawer(
            child: Container(
              // التوجل لسه فيه مشكلة
              //color:ThemeCubit.get(context).isDark ? Colors.grey.shade900: Colors.blue,
              color: HexColor('#396691'),
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
                      child: Row(
                        children:  <Widget>[
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 85.45,
                            height: 85.45,
                            decoration:  const BoxDecoration(shape: BoxShape.circle,
                            image:
                            DecorationImage(image:
                            NetworkImage('https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/127647071_1017495768677466_7815514853870818408_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeFRgzSgXqtOH1nplAvb_j8rE3Ks6IOpkVgTcqzog6mRWInNV_LK7qlPxrMCf1BvQKxWye6pjuVb81LLAKZZ33AO&_nc_ohc=6blo7UWUIzEAX-oiQlP&_nc_ht=scontent.fcai20-5.fna&oh=a1c9a8601f16af5247813b7dd97093dc&oe=61973284'),
                                fit: BoxFit.fill
                            ),
                            ),
                            ),
                          const SizedBox(width: 7.5,),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 150.0,
                                child: Text('Mohammed Omar Abdelmonaem Ahmed Hassan Salem Ali Gallya' ,
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
                                child: Text('42018183' ,
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
                  ),

                  //                 سكرينات ال drawer
                  const SizedBox(height: 11.11,),
                  const CustomListDarkMode(),
                  const SizedBox(height: 22.22,),
                  const CustomListProfile(),
                  const SizedBox(height: 22.22,),
                  const CustomListHome(),
                  const SizedBox(height: 22.22,),
                  const CustomListHelp(),
                  const SizedBox(height: 22.22,),
                  const CustomListSettings(),
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
                          fontSize: 44.44,
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
             ThemeCubit.get(context).changeAppMode();
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
            navigateTo(context, const UserProfileScreen());
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
// class CustomListRateUs extends StatelessWidget{
//   const CustomListRateUs({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
//       child: Container(
//         decoration: const BoxDecoration(
//             border: Border(bottom:  BorderSide(color: Colors.grey))),
//         child: InkWell(
//           splashColor: defaultColor,
//           child: Container(
//             height: 44.44,
//             child: Row(
//               children: const <Widget>[
//                 Icon(Icons.rate_review,color: Colors.white
//                 ),
//                 SizedBox(width: 10.0,),
//                 Text('Rate Us', style: TextStyle(fontSize: 22.2 , fontWeight: FontWeight.bold,color: Colors.white),),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios,color: Colors.white
//                 ),
//               ],
//             ),
//           ),
//           onTap: (){},
//         ),
//       ),
//     );
//   }
// }
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
            navigateAndEnd(context, const LoginScreen());
          }
          ,
        ),
      ),
    );
  }
}
//..........................................................
// class CustomList extends StatelessWidget {
//
//   IconData icon;
//   String text;
//   Function onTap;
//
//   CustomList(this.icon , this.text , this.onTap);
//
//   @override
//     Widget build(BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
//         child: Container(
//           decoration: const BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.grey))
//           ),
//           child: InkWell(
//             splashColor: defaultColor,
//             child: Container(
//               height: 55.55,
//               child: Row(
//                 children:<Widget>[
//                   Icon(icon),
//                   const SizedBox(width: 10.0,),
//                   Text(text),
//                   const Spacer(),
//                   const Icon(Icons.arrow_forward_ios),
//                 ],
//               ),
//             ),
//             onTap: onTap(),
//           ),
//         ),
//       );
//     }
//   }



// class CustomListDarkMode extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.8, 0, 0, 8.8),
//       child: InkWell(
//         splashColor: defaultColor,
//         child: Container(
//           height: 44.44,
//           child: Row(
//             children: const <Widget>[
//               Icon(Icons.brightness_4_outlined),
//               SizedBox(width: 10.0,),
//               Text('Dark Mode'),
//             ],
//           ),
//         ),
//         onTap: (){},
//       ),
//     );
//   }
// }

