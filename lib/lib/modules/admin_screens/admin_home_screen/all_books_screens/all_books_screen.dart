import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/search_book_screen/search_book_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/search_students_access_book_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/upload_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'all_pdf_book_screen.dart';
import 'bussiness_students_access_book_screen.dart';
import 'cs_students_access_book_screen.dart';
import 'eng_students_access_book_screen.dart';


class AdminBooksScreen extends StatefulWidget {
  @override
  State<AdminBooksScreen> createState() => _AdminBooksScreenState();
}

class _AdminBooksScreenState extends State<AdminBooksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AppCubit.get(context).getUserData();
    AppCubit.get(context).getAdminBooks();
  }
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 60,
            right: 0,
            child: IconButton(icon: Icon(Icons.search_outlined), onPressed: ()
            {
              navigateTo(context, CsBookSearchScreen());
            }, iconSize: 30,
            ),
          ),
          Positioned(
            top: 60,
            right: 60,
            child: IconButton(icon: Icon(Icons.upload_rounded), onPressed: ()
            {
              navigateTo(context, UploadBookScreen());
            }, iconSize: 30,
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

      body: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: AppCubit.get(context).adminBooksModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 99, 0, 0),
              child: AnimationLimiter(
                child: GridView.count(
                  physics:
                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    AppCubit.get(context).adminBooksModel!.books!.length,
                        (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: Duration(milliseconds: 1200),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          scale: 1.5,
                          child: FadeInAnimation(
                            child: Container(
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Image(image: NetworkImage(
                                      AppCubit.get(context).adminBooksModel!.books![index].cover!,
                                    ),
                                      height: size.height * 0.123,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox( height: size.height *0.008
                                      ,),
                                    Expanded(
                                      child: Text(
                                        AppCubit.get(context).adminBooksModel!.books![index].name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                          //color: ThemeCubit.get(context). Colors.black ,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      height: size.height * 0.002,
                                      width: double.infinity,
                                      color: Colors.grey.withOpacity(0.5555),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.0075,
                                    ),
                                    Expanded(
                                      child: Text(
                                        AppCubit.get(context).adminBooksModel!.books![index].description!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color:  Colors.grey ,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  navigateTo(context, AdminPDFBooksScreen(
                                      BookId: index
                                  ),);

                                },
                                onLongPress: ()
                                {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context)
                                      {
                                        return Scaffold(
                                          floatingActionButton: Stack(
                                            // fit: StackFit.expand,
                                            children: [
                                              Positioned(
                                                top: 30,
                                                right: 0,
                                                child: IconButton(icon: Icon(Icons.search_outlined), onPressed: ()
                                                {
                                                  navigateTo(context, SearchStudentAccessBookScreen(
                                                    SearchAccessIndexBookId: AppCubit.get(context).adminBooksModel!.books![index].sId!,
                                                  ));
                                                },
                                                  iconSize: 30,
                                                ),
                                              ),
                                              Positioned(
                                                top: 30,
                                                left: 30,
                                                child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
                                                {
                                                  navigateAndEnd(context, AdminBooksScreen());
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
                                                Center(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children:
                                                      [
                                                        Padding(
                                                          padding:  EdgeInsets.fromLTRB(
                                                              0,
                                                              size.height * 0.066,
                                                              0,
                                                              0
                                                          ),
                                                          child: defaultButton(
                                                            function: ()
                                                            {
                                                              navigateTo(context, CSStudentAccessBookScreen(
                                                                CsAccessIndexBookId: AppCubit.get(context).adminBooksModel!.books![index].sId!,
                                                              ));
                                                            },
                                                            text: 'Computer Science',
                                                            fontSize: size.width * 0.035,
                                                            context: context,
                                                            height: size.height * 0.1,
                                                            width: size.width,
                                                          ),
                                                        ),
                                                        SizedBox(height: size.height * 0.01,),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(
                                                              0,
                                                              0,
                                                              0,
                                                              0
                                                          ),
                                                          child: defaultButton(
                                                            function: ()
                                                            {
                                                              navigateTo(context, EngStudentAccessBookScreen(
                                                                EngAccessIndexBookId: AppCubit.get(context).adminBooksModel!.books![index].sId!,

                                                              ));
                                                            },
                                                            text: 'Engineering',
                                                            fontSize: size.width * 0.035,
                                                            context: context,
                                                            height: size.height * 0.1,
                                                            width: size.width,
                                                          ),
                                                        ),
                                                        SizedBox(height: size.height * 0.01,),
                                                        Padding(
                                                          padding: EdgeInsets.fromLTRB(
                                                              0,
                                                              0,
                                                              0,
                                                              0
                                                          ),
                                                          child: defaultButton(
                                                            function: ()
                                                            {
                                                              navigateTo(context, BusinessStudentAccessBookScreen(
                                                                BusinessAccessIndexBookId: AppCubit.get(context).adminBooksModel!.books![index].sId!,
                                                              ));
                                                            },
                                                            text: 'Business Management',
                                                            fontSize: size.width * 0.035,
                                                            context: context,
                                                            height: size.height * 0.1,
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
                                  );
                                },
                              ),
                              margin: EdgeInsets.only(
                                  bottom: _w / 30, left: _w / 60, right: _w / 60),
                              decoration: BoxDecoration(
                                color: ThemeCubit.get(context).darkTheme ? Colors.grey.shade700 :Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}