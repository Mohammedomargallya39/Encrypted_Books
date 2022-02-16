import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admins_screens/admins_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/business_students_screens/business_students_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'search_screens/search_screen.dart';
import 'cs_students_screens/cs_students_screen.dart';
import 'eng_students_screens/eng_students_screen.dart';

class StudentsDepartmentsScreen extends StatelessWidget {
  const StudentsDepartmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments',),
        actions: [
          IconButton(
            onPressed: ()
            {
              navigateTo(context, StudentsSearchScreen());
            },
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                child: defaultButton(
                  function: ()
                  {
                    navigateTo(context, AdminsScreen());
                  },
                  text: 'Admins',
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
      ),
    );
  }
}
