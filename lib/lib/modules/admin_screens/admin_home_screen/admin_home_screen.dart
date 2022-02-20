import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/students_departments.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'all_books_screens/all_books_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state){
            return Scaffold(
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
                          Text('Welcome Admin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/admin.svg',
                            height: size.height * 0.4,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                            child: defaultButton(
                              function: ()
                              {
                                navigateTo(context, StudentsDepartmentsScreen());
                              },
                              text: 'Departments',
                              context: context,
                              height: size.height * 0.08,
                              width: size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                            child: defaultButton(
                              function: ()
                              {
                                navigateTo(context, AdminBooksScreen());
                              },
                              text: 'Books',
                              context: context,
                              height: size.height * 0.08,
                              width: size.width,
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
      },
    );
  }
}