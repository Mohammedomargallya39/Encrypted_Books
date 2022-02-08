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
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Books'),
              ),
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index) => InkWell(child: userOnlineBooksItem(
                      cubit.homeModel!.books![index].bookId! , context),
                  onTap: ()
                  {
                    navigateTo(context, UserPDFBooksScreen(
                      bookId : index,
                    ));
                  },),
                  separatorBuilder:(context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  itemCount: cubit.homeModel!.books!.length),
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
                      fontSize: 20
                  ),
                ),
              ),
            ),
          );
        },
      );
  }
  Widget userOnlineBooksItem(BookId bookId , context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
        child: Center(
          child: Column(
            children: [
               SizedBox(height: size.height * 0.02),
              Image(
                image: NetworkImage(
                    '${bookId.cover}'
                ),
                width: size.width,
                height: size.height * 0.22,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                '${bookId.name}',
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
            ],
          ),
        ),
      ),
    );
  }
}