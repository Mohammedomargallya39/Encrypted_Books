import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/user_books_model.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/books/user_pdf_books_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class UserOnlineBooksScreen extends StatelessWidget {
  const UserOnlineBooksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          //var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: AppCubit.get(context).homeModel != null,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Books'),
              ),
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index) => userOnlineBooksItem(AppCubit.get(context).homeModel!.books![index].bookInfo! , context),
                  separatorBuilder:(context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  itemCount: AppCubit.get(context).homeModel!.books!.length),



            ),
            fallback:(context) => Scaffold(
              appBar: AppBar(title: Text('Your Books'
              ),
              ),
              body: Center(
                child: Text('You Do not have any books yet',
                  style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }


  Widget userOnlineBooksItem(BooksInfoModel booksInfoModel , context) =>
      InkWell(
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            Column(
              children:  [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: NetworkImage(
                      '${booksInfoModel.cover}'
                    ),
                    width: double.infinity,
                    height: 200.0,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20.0,),
        Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '${booksInfoModel.name}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,)
          ],
        ),
        onTap: ()
        {
          navigateTo(context, UserPDFBooksScreen(
            bookId : booksInfoModel.id,
          ));
        },
      );

}
