import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';

class UserDetailsPhotoDetails extends StatelessWidget {
  const UserDetailsPhotoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
                Center(child: Image(image: NetworkImage(
                    '${AppCubit.get(context).userModel!.image}'
                ),
                ),
                ),
            ],
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
