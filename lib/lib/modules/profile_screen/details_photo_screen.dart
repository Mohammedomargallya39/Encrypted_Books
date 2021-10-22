import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPhotoDetails extends StatelessWidget {
  const DetailsPhotoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.network(
            'https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/238882960_1176013169492391_5072941271790244082_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHCO-p1ixoRqId9sspm6bhQ_jFSmEOR4a_-MVKYQ5Hhr5rmNp0DG9FzWhlQV-bM24IAPfZhrhb3QCtjgrz5Yjph&_nc_ohc=FxpbbG2MlpoAX_V0rmy&_nc_ht=scontent.fcai20-5.fna&oh=002060ad2ae580b86e38d96a5ad463ae&oe=617252BE',
          ),
        ),


        onTap: ()
        {
          Navigator.pop(context);
        },
      ),
    );
  }
}
