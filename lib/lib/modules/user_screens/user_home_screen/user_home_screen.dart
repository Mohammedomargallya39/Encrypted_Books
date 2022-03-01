import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'books/user_books_screen.dart';
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (BuildContext context, state)
          {
            return Scaffold(
                body: Container(
                  width: size.width,
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
                            Text(
                              'Welcome to HTI Books',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03,),
                            SvgPicture.asset('assets/icons/read.svg',height: size.height * 0.4,),
                            SizedBox(height: size.height * 0.03,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                              child: defaultButton(
                                function: ()
                                {
                                  navigateTo(context, const UserBooksScreen());
                                },
                                text: 'Your Books',
                                fontSize: size.width * 0.035,
                                context: context,
                                height: size.height * 0.1,
                                width: size.width,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            );
          },
        );
      },
    );
  }
}