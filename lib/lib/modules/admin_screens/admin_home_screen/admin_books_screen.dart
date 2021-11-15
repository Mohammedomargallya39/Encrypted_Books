import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/admin_books_model.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_pdf_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class AdminBooksScreen extends StatelessWidget {
  const AdminBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          //var cubit = AppCubit.get(context);
          return Scaffold(
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
                itemBuilder: (context,index) => adminBooksItem(AdminBooksModel() , context),
                separatorBuilder:(context,index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                itemCount: 22,
            ),
          );
        },
      ),

    );
  }
  Widget adminBooksItem(AdminBooksModel model , context) => InkWell(
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/images/life_book.jpg"),
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
                                itemBuilder: (context,index) => addStudentToBooksItem(StudentsModel() , context),
                                separatorBuilder:(context,index)=> Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.0,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                ),
                                itemCount: 22,
                              ),
                            );
                          }
                      );
                    },
                    icon:
                    const Icon(Icons.remove)
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                  child: Text(
                      'كتاب حياتي ياعين',
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
                                itemBuilder: (context,index) => addStudentToBooksItem(StudentsModel() , context),
                                separatorBuilder:(context,index)=> Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1.0,
                                    width: double.infinity,
                                    color: Colors.grey,
                                  ),
                                ),
                                itemCount: 22,
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
            const SizedBox(height: 10.0,)
          ],
        ),
        onTap: ()
        {
          navigateTo(context, AdminPDFBooksScreen());
        },
      );
  Widget addStudentToBooksItem(StudentsModel model , context) => InkWell(
    child: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>
        [
          Container(
            margin: const EdgeInsets.all(10),
            width: 75,
            height:75,
            decoration:  const BoxDecoration(shape: BoxShape.circle,
              image: DecorationImage(image:
              NetworkImage('https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/127647071_1017495768677466_7815514853870818408_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeFRgzSgXqtOH1nplAvb_j8rE3Ks6IOpkVgTcqzog6mRWInNV_LK7qlPxrMCf1BvQKxWye6pjuVb81LLAKZZ33AO&_nc_ohc=6blo7UWUIzEAX-oiQlP&_nc_ht=scontent.fcai20-5.fna&oh=a1c9a8601f16af5247813b7dd97093dc&oe=61973284'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Column(
            children:  <Widget>
            [
              SizedBox(
                width: 300,
                child: Text('Mohammed Omar Abdelmonaem Ahmed Hassan Salem Ali Gallya' ,
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
                child: Text('42018183' ,
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
        ],
      ),
    ),
    onTap: ()
    {
    },
  );

}
