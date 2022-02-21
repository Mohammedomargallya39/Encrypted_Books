import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/search_screens/student_book_pdf_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'all_books_can_added_to_student_pdf_screen.dart';

class StudentBookScreen extends StatefulWidget {
  const StudentBookScreen({Key? key, required this.StudentBooksId}) : super(key: key);
  final int StudentBooksId;

  @override
  State<StudentBookScreen> createState() => _StudentBookScreenState();
}

class _StudentBookScreenState extends State<StudentBookScreen> {
  final pageController = PageController(viewportFraction: 0.8);
  var searchAllBooksController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  double page = 0.0;
  void listenScroll() {
    setState(() {
      page = pageController.page!;
    });
  }

  @override
  void initState() {
    pageController.addListener(listenScroll);

    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(listenScroll);
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int columnCount = 1;
    double _w = MediaQuery.of(context).size.width;

    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return BlocBuilder<ThemeCubit,ThemeStates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.searchStudentModel![widget.StudentBooksId].books != null,
                builder: (context) =>  Scaffold(
                  floatingActionButton: Stack(
                    // fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 60,
                        right: 0,
                        child: IconButton(icon: Icon(Icons.add), onPressed: ()
                        {
                          showModalBottomSheet(
                              context: context,
                              builder: (context)
                              {
                                return BlocConsumer<AppCubit,AppStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return Scaffold(
                                      floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
                                        ,onPressed: ()
                                        {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                                      body: SafeArea(
                                        child: Container(
                                          width: size.width,
                                          height: size.height,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Image.asset('assets/images/main_top.png',
                                                  width: size.width * 0.25,),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Image.asset('assets/images/login_bottom.png',
                                                  width: size.width * 0.3,),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                                                child: Form(
                                                  key: formKey,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: size.height *0.044,
                                                      ),
                                                      defaultFormField(
                                                        context: context,
                                                        controller: searchAllBooksController,
                                                        text: 'Search by name',
                                                        prefix: Icons.search,
                                                        suffix: Icons.forward,
                                                        suffixPressed: ()
                                                        {
                                                          AppCubit.get(context).SearchBookForStudent(
                                                              text: searchAllBooksController.text
                                                          );
                                                        },
                                                        type: TextInputType.text,
                                                        validate: (String? value) {
                                                          if (
                                                          value!.isEmpty
                                                              ||
                                                              value.toString() == false
                                                          ) {
                                                            return 'Search for books';
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                      ),
                                                      if (state is AdminSearchBookForStudentLoadingState) LinearProgressIndicator(),
                                                      SizedBox(
                                                        height: size.height * 0.044,
                                                      ),
                                                      if (state is AdminSearchBookForStudentSuccessState && formKey.currentState!.validate())
                                                        ConditionalBuilder(
                                                          condition: AppCubit.get(context).searchBookModel != null,
                                                          builder: (context) =>  Expanded(
                                                            child: AnimationLimiter(
                                                              child: GridView.count(
                                                                physics:
                                                                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                padding: EdgeInsets.all(_w / 60),
                                                                crossAxisCount: columnCount,
                                                                children: List.generate(
                                                                  AppCubit.get(context).searchBookModel!.books!.length,
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
                                                                                    AppCubit.get(context).searchBookModel!.books![index].cover!,
                                                                                  ),
                                                                                    height: size.height * 0.2,
                                                                                    width: size.width,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  SizedBox( height: size.height *0.02
                                                                                    ,),
                                                                                  Text(
                                                                                    AppCubit.get(context).searchBookModel!.books![index].name!,
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: TextStyle(
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color:  Colors.black ,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox( height: size.height *0.02
                                                                                    ,),
                                                                                  Container(
                                                                                    height: size.height *0.002,
                                                                                    width: double.infinity,
                                                                                    color: Colors.grey.withOpacity(0.5555),
                                                                                  ),
                                                                                  SizedBox( height: size.height *0.02
                                                                                    ,),
                                                                                  Text(
                                                                                    AppCubit.get(context).searchBookModel!.books![index].description!,
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: TextStyle(
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color:  Colors.black ,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              onTap: ()
                                                                              {
                                                                                navigateTo(context,
                                                                                    BooksCanAddedForStudentPdfScreen(
                                                                                      StudentBookIndexId: index ,
                                                                                      StudentIndexId: widget.StudentBooksId,
                                                                                    )
                                                                                )
                                                                                ;
                                                                              },
                                                                            ),
                                                                            margin: EdgeInsets.only(
                                                                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.white,
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
                                                          fallback: (context) =>  Scaffold(
                                                            body: Center(child: Text('Search for Books')),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                          );
                        }, iconSize: 30,
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 30,
                        child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
                        {
                          Navigator.pop(context);
                        }, iconSize: 23,
                        ),
                      ),
                    ],
                  ),
                  body: SafeArea(
                    child: Container(
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
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.4,
                            child: PageView.builder(
                                controller: pageController,
                                itemCount: cubit.searchStudentModel![widget.StudentBooksId].books!.length,
                                itemBuilder: (context, index) {
                                  final percent = (page - index).abs().clamp(0.0, 1.0);
                                  final factor = pageController.position.userScrollDirection ==
                                      ScrollDirection.forward
                                      ? 1.0
                                      : -1.0;
                                  final opacity = percent.clamp(0.0, 0.7);
                                  return Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateY(vector.radians(45 * factor * percent)),
                                    child: Opacity(
                                      opacity: (1 - opacity),
                                      child: Card(
                                          elevation: 11,
                                          color: ThemeCubit.get(context).darkTheme? Colors.grey.shade700 :Colors.grey.shade300,
                                          child: InkWell(
                                            child: Column(
                                              children: [
                                                Image(
                                                    fit: BoxFit.cover,
                                                    width: size.width,
                                                    height: size.height * 0.26,
                                                    image: NetworkImage(
                                                        AppCubit.get(context).searchStudentModel![widget.StudentBooksId].books![index].cover!
                                                    )),
                                                SizedBox(height: size.height * 0.02),
                                                Text(
                                                  AppCubit.get(context).searchStudentModel![widget.StudentBooksId].books![index].name!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: size.height * 0.02),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    border: Border(bottom:  BorderSide(color: Colors.grey),),
                                                  ),
                                                ),
                                                SizedBox(height: size.height * 0.02),
                                                Text(
                                                  AppCubit.get(context).searchStudentModel![widget.StudentBooksId].books![index].description!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: ()
                                            {
                                              navigateTo(context, StudentBookPDFScreen(
                                                StudentBookId: index,
                                                StudentID: widget.StudentBooksId,
                                              ),
                                              );
                                            },
                                          )
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                fallback:(context) => Scaffold(
                  appBar: AppBar(title: Text('Your Books'
                  ),
                  ),
                  body: Center(
                    child: Text('Student Does not have any books yet.',
                      style:
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22 ,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
  }
  Widget addBooksForStudentsItem(AdminBooksDetails books, context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.015),
        Column(
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(
                    books.cover!
                ),
                width: size.width,
                height: size.height *0.15,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.015),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              books.name!
              ,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}