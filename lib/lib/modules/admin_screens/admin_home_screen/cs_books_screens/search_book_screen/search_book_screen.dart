import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/search_book_model.dart';
import 'package:social/lib/models/search_student_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/cs_books_screens/search_book_screen/pdf_book_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/search_screens/student_details_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class CsBookSearchScreen extends StatelessWidget {
  CsBookSearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    suffixPressed: ()
                    {
                      AppCubit.get(context).SearchBook(
                          text: searchController.text
                      );
                    },
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search for students';
                      } else {
                        return null;
                      }
                    },
                    // onSubmit: (value) {
                    //   if (formKey.currentState!.validate()) {
                    //     AppCubit.get(context)
                    //         .CSSearchStudent(text: searchController.text);
                    //   }
                    // },
                  ),
                  if (state is AdminSearchBookLoadingState) LinearProgressIndicator(),
                  SizedBox(
                    height: size.height * 0.044,
                  ),
                  if (state is AdminSearchBookSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index)
                        {
                          return InkWell(
                            child: SearchBookItem(
                                Books(
                                  name: AppCubit.get(context).searchBookModel!.books![index].name,
                                  cover: AppCubit.get(context).searchBookModel!.books![index].cover,
                                ), context
                            ),
                            onTap: ()
                            {
                              navigateTo(context, PDFBooksScreen(
                                  SearchBookId: index
                              ),
                              );
                            },
                          );
                        } ,

                        separatorBuilder: (context, index) => Container(
                          width: size.width,
                          color: Colors.grey,
                          height: size.height * 0.0009,
                        ),

                        itemCount: AppCubit.get(context).searchBookModel!.books!.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }

  Widget SearchBookItem(Books searchBookModel , context)
  {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.015),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(
                    searchBookModel.cover!
                ),
                width: size.width,
                height: size.height *0.15,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.015),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  searchBookModel.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        // TextButton(onPressed: ()
        // {
        //   showDialog(context: context,
        //       builder: (context) => DeleteBooksAlertDialog(
        //         description: 'Delete This Book',
        //         title: 'Are you sure?'
        //         ,)
        //     ,);
        // },
        //   child: Text('Delete this book',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 18,
        //     color: Colors.red,
        //   ),
        // ),
        // ),
      ],
    );
  }
}
