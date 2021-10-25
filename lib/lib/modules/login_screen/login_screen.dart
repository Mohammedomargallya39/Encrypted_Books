import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/modules/login_screen/user_login_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';

import 'admin_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
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
                    navigateTo(context, UserLoginScreen());
                  },

                  child: const Text('User login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 55),
              SizedBox(
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
                    navigateTo(context, const AdminLoginScreen());
                  },

                  child: const Text('Admin login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
