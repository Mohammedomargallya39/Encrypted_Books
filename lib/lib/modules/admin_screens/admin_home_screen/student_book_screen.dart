import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/students_model.dart';

class StudentBookScreen extends StatelessWidget {
  const StudentBookScreen({Key? key, required this.studentBooksId}) : super(key: key);
  final int studentBooksId;

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.studentsModel![studentBooksId].books != null,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Student books'),

                actions: [
                  IconButton(
                    onPressed: ()
                    {
                      showModalBottomSheet(
                          context: context,
                          builder: (context)
                          {
                            return Scaffold(
                              appBar: AppBar(title: const Text('Add books'),),
                              body: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context,index) => addBooksForStudentsItem(
                                    AdminBooksDetails(
                                        name: cubit.adminBooksModel!.books![index].name,
                                        cover: cubit.adminBooksModel!.books![index].cover
                                    ) , context),
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
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index) => InkWell(child: studentBooks(
                    StudentBookId(
                      name:AppCubit.get(context).studentsModel![index].books![studentBooksId].bookId!.name,
                      cover:AppCubit.get(context).studentsModel![index].books![studentBooksId].bookId!.cover,
                    ), context),
                    // onTap: ()
                    // {
                    //   navigateTo(context, UserPDFBooksScreen(
                    //     bookId : index,
                    //   ));
                    // },
                  ),
                  separatorBuilder:(context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  itemCount: cubit.studentsModel![studentBooksId].books!.length),
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
                      fontSize: 22
                  ),
                ),
              ),
            ),
          );
        },
      );
  }

  Widget studentBooks(StudentBookId studentBookId , context) => Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              Image(
                image: NetworkImage(
                    '${studentBookId.cover}'
                ),
                width: double.infinity,
                height: 200.0,
              ),
              const SizedBox(height: 10.0,),
              Text(
                '${studentBookId.name}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10.0,),
              TextButton(
                  onPressed: ()
                  {

                  },
                  child: Text('Remove this book.'),
              ),
              const SizedBox(height: 20.0,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey),),
                ),
              ),
            ],
          ),
        ),
      );

  Widget addBooksForStudentsItem(AdminBooksDetails books, context) => InkWell(
    child: Column(
      children: [
        const SizedBox(height: 10.0,),
        Column(
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(
                    books.cover!
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
              books.name!
              ,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

      ],
    ),
    onTap: ()
    {
    },
  );
}

