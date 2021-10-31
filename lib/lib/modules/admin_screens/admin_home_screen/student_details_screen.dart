import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:social/lib/models/user_books_model.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_details_photo_screen.dart';
import 'package:social/lib/shared/styles/colors.dart';

class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            <Widget>
            [
              // الصورة
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
                        return const UserDetailsPhotoDetails() ;
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
              const SizedBox(
                width: double.infinity,
                child: Text('Mohammed Omar Abdelmonaem Ahmed Hassan Salem Ali Gallya',
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
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),
              const SizedBox(height: 33,),

              Center(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  elevation: 17.5,
                  color: defaultColor,
                  onPressed: () {},
                  child:
                  const Text('Add books',
                    style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                height: 33,
                decoration: const BoxDecoration(
                  border: Border(bottom:  BorderSide(color: Colors.grey , width: 3),),
                ),
              ),

              const SizedBox(height: 22,),


              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index) => studentBooksItem(UserBooksModel() , context),
                  separatorBuilder:(context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  itemCount: 7),



            ],
          ),
        ),
      ),
    );
  }

  Widget studentBooksItem(userBooksModel,  context)
  {
    return SizedBox(
      height: 66,
      child: Row(
        children:  <Widget>[
          const Text('كتاب حياتي يعين' ,
            style: TextStyle( fontWeight: FontWeight.bold
              , fontSize: 22,

            ),
            ),
          const Spacer(),
          IconButton(
            onPressed: (){},
            icon: const Icon(
                Icons.remove),
          ),
        ],
      ),
    );

  }
}


