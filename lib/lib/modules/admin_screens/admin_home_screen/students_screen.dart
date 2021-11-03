import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/student_details_screen.dart';
import 'package:social/lib/shared/components/components.dart';

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
          itemBuilder:  (context,index) => studentsItem(StudentsModel() , context),
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

  Widget studentsItem(StudentsModel model , context) => InkWell(
    child: Row(

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
       const SizedBox(width: 5,),
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:   const <Widget>
           [
             Text('Mohammed Omar Abdelmonaem Ahmed Hassan Salem Ali Gallya' ,
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                   fontWeight: FontWeight.bold ,
                   fontSize: 22.22 ,
               ),
             ),

             SizedBox(height: 5,),

             Text('42018183' ,
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                   fontWeight: FontWeight.bold ,
                   fontSize: 22.22 ,
               ),
             ),
           ],
         ),
       ),
       const Spacer(),
       IconButton(
         onPressed: ()
         {
           navigateTo(context, const StudentDetailsScreen());
         },
         icon: const Icon(Icons.arrow_forward_ios),
       ),
     ],
    ),
    onTap: ()
    {
      navigateTo(context, const StudentDetailsScreen());
    },
  );
}