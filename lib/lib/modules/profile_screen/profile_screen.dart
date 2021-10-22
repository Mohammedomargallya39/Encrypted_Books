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
                      NetworkImage('https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/238882960_1176013169492391_5072941271790244082_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHCO-p1ixoRqId9sspm6bhQ_jFSmEOR4a_-MVKYQ5Hhr5rmNp0DG9FzWhlQV-bM24IAPfZhrhb3QCtjgrz5Yjph&_nc_ohc=FxpbbG2MlpoAX_V0rmy&_nc_ht=scontent.fcai20-5.fna&oh=002060ad2ae580b86e38d96a5ad463ae&oe=617252BE'),
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



