import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/students_model.dart';

class AdminBooksScreen extends StatelessWidget {
  const AdminBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.adminBooksModel!.books != null,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Books'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_rounded),
                  ),

                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.search_outlined),
                  ),
                ],
              ),
              body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index) => adminBooksItem(AdminBooksDetails(
                  name:cubit.adminBooksModel!.books![index].name ,
                  cover:cubit.adminBooksModel!.books![index].cover ,
                ) , context),
                separatorBuilder:(context,index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                itemCount:cubit.adminBooksModel!.books!.length,
              ),
            ),
            fallback: (context) => Scaffold(
              body: Center(
                  child: Text('No Books added yet.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
            ),
          );
        },
      );
  }
  Widget adminBooksItem(AdminBooksDetails books , context) => Column(
    children: [
      const SizedBox(height: 10.0,),
      Column(
        children: [
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
      Row(
        children:  [
          IconButton(
              onPressed: ()
              {
                showModalBottomSheet(
                    context: context,
                    builder: (context)
                    {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Remove students'),),
                        body: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index) => InkWell(
                            child: removeStudentToBooksItem(StudentsModel(
                              name: AppCubit.get(context).studentsModel![index].name,
                              email: AppCubit.get(context).studentsModel![index].email,
                              image: AppCubit.get(context).studentsModel![index].image,
                            ) , context),
                            onTap: ()
                            {

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
                          itemCount: AppCubit.get(context).studentsModel!.length,
                        ),
                      );
                    }
                );
              },
              icon:
              const Icon(Icons.remove)
          ),
          const Spacer(),
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
            child: Text(
                books.name!,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: ()
              {
                showModalBottomSheet(
                    context: context,
                    builder: (context)
                    {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Add students'),),
                        body: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index) => InkWell(
                            child: addStudentToBooksItem(StudentsModel(
                              name: AppCubit.get(context).studentsModel![index].name,
                              image: AppCubit.get(context).studentsModel![index].image,
                              email: AppCubit.get(context).studentsModel![index].email,
                            ) , context),
                            onTap: ()
                            {

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
                          itemCount: AppCubit.get(context).studentsModel!.length,
                        ),
                      );
                    }
                );
              },
              icon:
              const Icon(Icons.add)
          ),

        ],
      ),
      const SizedBox(height: 10.0,),
      TextButton(onPressed: ()
      {

      }, child: Text('Delete this book',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.red,
        ),
      ),
      ),
    ],
  );
  Widget addStudentToBooksItem(StudentsModel studentsAddModel , context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>
    [
      Container(
        margin: const EdgeInsets.all(10),
        width: 75,
        height:75,
        decoration:  BoxDecoration(shape: BoxShape.circle,
          image: DecorationImage(image:
          NetworkImage(
              studentsAddModel.image!
              ),
              fit: BoxFit.fill,
          ),
        ),
      ),
      Column(
        children:  <Widget>
        [
          SizedBox(
            width: 300,
            child: Text(
              studentsAddModel.name! ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 22.22 ,
              ),
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: 300,
            child: Text(
              studentsAddModel.email!.split('@').first ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 22.22 ,
              ),
            ),
          ),
        ],
      ),
      Spacer(),
      IconButton(onPressed: ()
      {

      },
          icon: Icon(Icons.add) )
    ],
  );
  Widget removeStudentToBooksItem(StudentsModel studentsRemoveModel , context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>
    [
      Container(
        margin: const EdgeInsets.all(10),
        width: 75,
        height:75,
        decoration: BoxDecoration(shape: BoxShape.circle,
          image: DecorationImage(image:
          NetworkImage(
            studentsRemoveModel.image!
             ),
              fit: BoxFit.fill
          ),
        ),
      ),
      Column(
        children:  <Widget>
        [
          SizedBox(
            width: 300,
            child: Text(
              studentsRemoveModel.name! ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 22.22 ,
              ),
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: 300,
            child: Text(
              studentsRemoveModel.email!.split('@').first ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 22.22 ,
              ),
            ),
          ),
        ],
      ),
      Spacer(),
      IconButton(onPressed: ()
      {

      },
          icon: Icon(Icons.remove) )
    ],
  );

}
