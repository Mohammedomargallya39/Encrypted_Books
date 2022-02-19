import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';

class AdminDetailsPhotoDetails extends StatelessWidget {
  const AdminDetailsPhotoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
        ,onPressed: ()
        {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: GestureDetector(
        child: Center(
          child: Image.network(
           '${AppCubit.get(context).userModel!.image}',
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
