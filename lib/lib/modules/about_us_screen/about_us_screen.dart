import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(17.5,200,17.5,55),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      <Widget>
                      [
                        Text('What is Book Spot? ',
                          maxLines: 22,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: size.height * 0.02,),
                        SizedBox(
                          width: size.width,
                          child:
                          Text('Book Spot is an educational program for books that is used to provide books to students on mobile phones as an alternative to buying books and this helps in saving time and money for students. And helps the book owner to secure and encrypt his book so that no one can use it except the students who study with him. ',
                            maxLines: 22,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,),),
                        ),
                        SizedBox(height: size.height * 0.02,),
                        Text('How to use Book Spot? ',
                          maxLines: 22,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: size.height * 0.02,),
                        SizedBox(
                          width: size.width,
                          child:
                          AppCubit.get(context).userModel!.isAdmin?
                          Text('You are Admin. You can give the book to each student who studies with you on your own, where you will go to the Books page and double click on the book you want to give to the student and then select the section in which the student is located and give him the book or delete it from it. And if you press one click, you can see the book and you can see the book and read it, and you can delete the book and add a new book, and you can search for a specific book if there are many books. And in the Departments screen you can see all the departments and you can delete a student and see his data and you can add a book to him and delete a book from this page. And if there is a doctor or teaching assistant you want to make him admin, you can do that by clicking on the admin icon to add a new admin .',
                            maxLines: 22,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ) :
                          Text('you are a student . You can see what I wrote and you can listen to a specific book. If you do not want to read the book yourself, click on the listen icon. After clicking on it, you will listen to the page you are standing on.',
                            maxLines: 22,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.06,),
                        Text('If you found any technical issue contact with our developers',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: size.height * 0.02,),
                        defaultTextButton(
                          onPressed: ()
                          {
                            launchUrlString(
                                    'mailto:mohammed.gallya39@gmail.com?'
                                    'subject= Found Issue with Book Spot'
                                    '&body= Hi Mohammed, ' );
                          },
                          text: 'Flutter: Mohammed Omar',
                          fontSize: size.width * 0.033,
                        ),
                        SizedBox(height: size.height * 0.01,),
                        defaultTextButton(
                          onPressed: ()
                          {
                            launchUrlString(
                                'mailto:basselkhairy25@gmail.com?'
                                'subject= Found Issue with Book Spot'
                                '&body= Hi Bassel, ' );
                          },
                          text: 'Flutter: Bassel Khairy',
                          fontSize: size.width * 0.033,
                        ),

                        SizedBox(height: size.height * 0.01,),

                        defaultTextButton(
                          onPressed: ()
                          {
                            launchUrlString(
                                'mailto:okacrazyoka@gmail.com?'
                                'subject= Found Issue with Book Spot'
                                '&body= Hi Hussien, ' );
                          },
                          text: 'Backend: Hussien Ashraf',
                          fontSize: size.width * 0.033,
                        ),

                        SizedBox(height: size.height * 0.01,),

                        defaultTextButton(
                          onPressed: ()
                          {
                            launchUrlString(
                                'mailto:mr42018169@gmail.com?'
                                'subject= Found Issue with Book Spot'
                                '&body= Hi Mohammed, ' );
                          },
                          text: 'Backend: Mohammed Reda',
                          fontSize: size.width * 0.033,
                        ),

                        SizedBox(height: size.height * 0.01,),

                        defaultTextButton(
                          onPressed: ()
                          {
                            launchUrlString(
                                'mailto:mohamed.khalaf1212@outlook.com?'
                                'subject= Found Issue with Book Spot'
                                '&body= Hi Mohammed, ' );
                          },
                          text: 'Machine Learning: Mohammed Khalaf',
                          fontSize: size.width * 0.033,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
