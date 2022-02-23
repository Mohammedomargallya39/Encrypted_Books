import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admins_screens/admins_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/business_students_screens/business_students_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'search_screens/search_screen.dart';
import 'cs_students_screens/cs_students_screen.dart';
import 'eng_students_screens/eng_students_screen.dart';

class StudentsDepartmentsScreen extends StatefulWidget {
  const StudentsDepartmentsScreen({Key? key}) : super(key: key);

  @override
  State<StudentsDepartmentsScreen> createState() => _StudentsDepartmentsScreenState();
}

class _StudentsDepartmentsScreenState extends State<StudentsDepartmentsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AppCubit.get(context).getStudents();
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Stack(
        // fit: StackFit.expand,
        children: [
          Positioned(
            top: 60,
            right: 0,
            child: IconButton(icon: Icon(Icons.search_outlined), onPressed: ()
            {
              navigateTo(context, StudentsSearchScreen());
            }, iconSize: 30,
            ),
          ),
          Positioned(
            top: 99,
            right: 0,
            child: InkWell(
              child: Image.asset('assets/icons/admin_logo.png',
                height: size.height *0.125,
                width: size.width *0.125,
              ),
              onTap: ()
              {
                navigateTo(context, AdminsScreen());
              },
            ),
          ),
          Positioned(
            top: 60,
            left: 30,
            child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
            {
              navigateAndEnd(context, AdminDrawerScreen());
            }, iconSize: 23,
            ),
          ),
        ],
      ),
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
            Positioned(
              top: 33,
              left: 0,
              //bottom: 0,
              right: 0,

              child: SvgPicture.asset('assets/images/department.svg',
                width: size.width * 0.45,
                height: size.height * 0.45,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 222, 55, 5),
                      child: defaultButton(
                        function: ()
                        {
                          navigateTo(context, CsStudentsScreen());
                        },
                        text: 'Computer Science',
                        context: context,
                        height: size.height * 0.08,
                        width: size.width,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      child: defaultButton(
                        function: ()
                        {
                          navigateTo(context, EngStudentsScreen());
                        },
                        text: 'Engineering',
                        context: context,
                        height: size.height * 0.08,
                        width: size.width,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      child: defaultButton(
                        function: ()
                        {
                          navigateTo(context, BusinessStudentsScreen());
                        },
                        text: 'Business Management',
                        context: context,
                        height: size.height * 0.08,
                        width: size.width,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}