import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/models/students_model.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Students'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder:  (context,index) => studentsItem(StudentsModel()),
          separatorBuilder:(context,index)=> Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          itemCount: 22
      ),
    );
  }


  Widget studentsItem(StudentsModel model) =>

      Row(
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
           children: const <Widget>
           [
             SizedBox(
               width: 300.0,
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
               width: 300.0,
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
         const Spacer(),
         IconButton(
           onPressed: ()
           {

           },
           icon: const Icon(Icons.minimize_outlined),
         ),

         IconButton(
           onPressed: ()
           {

           },
             icon: const Icon(Icons.add),
         ),

       ],




      );



}
