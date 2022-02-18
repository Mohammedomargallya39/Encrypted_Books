import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/books/user_pdf_books_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class UserBooksScreen extends StatefulWidget {
  const UserBooksScreen({Key? key}) : super(key: key);

  @override
  _UserBooksScreenState createState() => _UserBooksScreenState();
}

class _UserBooksScreenState extends State<UserBooksScreen> {
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
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<ThemeCubit,ThemeStates>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: AppCubit.get(context).homeModel != null,
              builder: (context) => Scaffold(
                floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
                  ,onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                backgroundColor: ThemeCubit.get(context).darkTheme? Colors.grey.shade900 :Colors.white,
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
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.4,
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: AppCubit.get(context).homeModel!.books!.length,
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
                                        color: ThemeCubit.get(context).darkTheme? Colors.grey.shade700 :Colors.grey.shade300,
                                        child: InkWell(
                                          child: Column(
                                            children: [
                                              Image(
                                                  fit: BoxFit.cover,
                                                  width: size.width,
                                                  height: size.height * 0.26,
                                                  image: NetworkImage(
                                                      AppCubit.get(context).homeModel!.books![index].cover!
                                                  )),
                                              SizedBox(height: size.height * 0.02),
                                              Text(
                                                '${AppCubit.get(context).homeModel!.books![index].name}',
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
                                                '${AppCubit.get(context).homeModel!.books![index].description}',
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
                                            navigateTo(context, UserPDFBooksScreen(
                                              bookId : index,
                                            ));
                                          },
                                        )
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}