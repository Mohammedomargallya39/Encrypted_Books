import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/search_book_screen/pdf_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';

class CsBookSearchScreen extends StatelessWidget {
  CsBookSearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int columnCount = 1;
    double _w = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder:  (context, state) {
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
                      width: size.width * 0.35,),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset('assets/images/login_bottom.png',
                      width: size.width * 0.4,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 55, 20, 0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height *0.044,
                          ),
                          defaultFormField(
                            context: context,
                            controller: searchController,
                            text: 'Search by name',
                            prefix: Icons.search,
                            suffix: Icons.forward,
                            onChange: (value){
                              AppCubit.get(context).SearchBook(
                                  text: value
                              );
                            },
                            type: TextInputType.text,
                          ),
                          if (state is AdminSearchBookLoadingState) LinearProgressIndicator(),
                          SizedBox(
                            height: size.height * 0.044,
                          ),
                          // if (state is AdminSearchBookSuccessState && formKey.currentState!.validate())
                            ConditionalBuilder(
                              condition: AppCubit.get(context).searchBookModel != null,
                              builder: (context) => Expanded(
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
                                                        height: size.height * 0.24,
                                                        width: size.width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox( height: size.height *0.02
                                                        ,),
                                                      Expanded(
                                                        child: Text(
                                                          AppCubit.get(context).searchBookModel!.books![index].name!,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontSize: size.width * 0.04,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: size.height *0.002,
                                                        width: double.infinity,
                                                        color: Colors.grey.withOpacity(0.5555),
                                                      ),
                                                      SizedBox( height: size.height *0.02
                                                        ,),
                                                      Expanded(
                                                        child: Text(
                                                          AppCubit.get(context).searchBookModel!.books![index].description!,
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
                                                    navigateTo(context, PDFBooksScreen(
                                                        SearchBookId: index
                                                    ),
                                                    );
                                                  },
                                                ),
                                                margin: EdgeInsets.only(
                                                    bottom: _w / 20, left: _w / 60, right: _w / 60 ,  top: _w / 20,),
                                                decoration: BoxDecoration(
                                                  color: ThemeCubit.get(context).darkTheme?Colors.grey.shade700:Colors.white,
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
                              fallback: (context) =>  Expanded(
                                  child: Center(
                                      child:
                                      //Text('Search for Books'),
                                    SvgPicture.asset('assets/images/search_books.svg',
                                      height: size.height * 0.3,
                                    )
                                  ),
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
      } ,
    );
  }
}