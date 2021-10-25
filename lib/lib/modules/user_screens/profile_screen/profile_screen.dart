import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details_photo_screen.dart';

class  ProfileScreen extends StatelessWidget {

  const ProfileScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          <Widget>
          [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 33, 0, 0),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 275,
                    height: 275,
                    decoration:  const BoxDecoration(shape: BoxShape.circle,
                      image: DecorationImage(image:
                      NetworkImage('https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/127647071_1017495768677466_7815514853870818408_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeFRgzSgXqtOH1nplAvb_j8rE3Ks6IOpkVgTcqzog6mRWInNV_LK7qlPxrMCf1BvQKxWye6pjuVb81LLAKZZ33AO&_nc_ohc=6blo7UWUIzEAX-oiQlP&_nc_ht=scontent.fcai20-5.fna&oh=a1c9a8601f16af5247813b7dd97093dc&oe=61973284'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return const DetailsPhotoDetails() ;
                    }));
                  },
                ),
              ),
            ),



            const SizedBox(height: 33.33,),
            const Text('Name :',
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Container(
              width: double.infinity,
              child: const Text('Mohammed Omar Abdelmonaem Ahmed Hassan Salem Ali Gallya',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 19,),),
            ),
            const SizedBox(height: 8,),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom:  BorderSide(color: Colors.grey),),
              ),
            ),

            const SizedBox(height: 22,),
            const Text('ID :',
              style: TextStyle(fontSize: 33,
                  fontWeight:
                  FontWeight.bold),),
            const SizedBox(height: 8,),
            const Text('42018183',
              style: TextStyle(
                fontSize: 19,),),
            const SizedBox(height: 8,),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom:  BorderSide(color: Colors.grey),),
              ),
            ),

            const SizedBox(height: 22,),
            const Text('NO. of books :',
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            const Text('7',
              style: TextStyle(
                fontSize: 19,),),
            const SizedBox(height: 8,),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom:  BorderSide(color: Colors.grey),),
              ),
            ),


          ],
        ),
      ),
    );

  }
}



