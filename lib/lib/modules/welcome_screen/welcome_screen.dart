import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/login_screens/register_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/main_top.png'),
              width: size.width * 0.3,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset('assets/images/main_bottom.png'),
              width: size.width * 0.2,
            ),
            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WELCOME',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height:  size.height * 0.05,),
                    SvgPicture.asset('assets/icons/chat.svg',
                    height: size.height * 0.45,),
                    SizedBox(height:  size.height * 0.05,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                          elevation: 5,
                          color: defaultColor,
                          onPressed: ()
                          {
                            navigateAndEnd(context, LoginScreen());
                          },
                          child: const Text('LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                          elevation: 5,
                          color: ButtonPrimaryLightColor,
                          onPressed: ()
                          {
                            navigateAndEnd(context, RegisterScreen());
                          },
                          child: const Text('SIGNUP',
                            style: TextStyle(
                              color: Colors.black,
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
  }
}
