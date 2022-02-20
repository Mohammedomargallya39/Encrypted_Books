import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'business_all_books_can_added_to_student_pdf_screen.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'business_student_book_pdf_screen.dart';

class BusinessStudentBookScreen extends StatefulWidget {
  const BusinessStudentBookScreen({Key? key, required this.BusinessStudentBooksId}) : super(key: key);
  final int BusinessStudentBooksId;

  @override
  State<BusinessStudentBookScreen> createState() => _BusinessStudentBookScreenState();
}

class _BusinessStudentBookScreenState extends State<BusinessStudentBookScreen> {
  final pageController = PageController(viewportFraction: 0.8);
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

    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return BlocBuilder<ThemeCubit,ThemeStates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.businessStudentsModel![widget.BusinessStudentBooksId].books != null,
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
                                return Scaffold(
                                  appBar: AppBar(title: const Text('Add books'),),
                                  body: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context,index) => InkWell(
                                      child: addBooksForStudentsItem(
                                          AdminBooksDetails(
                                            name: cubit.adminBooksModel!.books![index].name,
                                            cover: cubit.adminBooksModel!.books![index].cover,
                                          ),
                                          context),
                                      onTap: ()
                                      {
                                        navigateTo(context,
                                            BusinessBooksCanAddedForStudentPdfScreen(
                                              BusinessStudentBookIndexId: index ,
                                              BusinessStudentIndexId: widget.BusinessStudentBooksId,
                                            )
                                        )
                                        ;
                                      },
                                    ),
                                    separatorBuilder:(context,index)=> Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 1.0,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    itemCount: cubit.adminBooksModel!.books!.length,
                                  ),
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
                                itemCount: cubit.businessStudentsModel![widget.BusinessStudentBooksId].books!.length,
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
                                                        AppCubit.get(context).businessStudentsModel![widget.BusinessStudentBooksId].books![index].cover!
                                                    )),
                                                SizedBox(height: size.height * 0.02),
                                                Text(
                                                  AppCubit.get(context).businessStudentsModel![widget.BusinessStudentBooksId].books![index].name!,
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
                                                  AppCubit.get(context).businessStudentsModel![widget.BusinessStudentBooksId].books![index].description!,
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
                                              navigateTo(context, BusinessStudentBookPDFScreen(
                                                BusinessStudentBookId: index,
                                                BusinessStudentID: widget.BusinessStudentBooksId,
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