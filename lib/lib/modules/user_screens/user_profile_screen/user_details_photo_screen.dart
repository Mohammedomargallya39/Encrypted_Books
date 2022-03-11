import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/shared/components/components.dart';

class UserDetailsPhotoDetails extends StatelessWidget {
  const UserDetailsPhotoDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProfileImageDetails(
      onPressed: ()
      {
        Navigator.pop(context);
      },
      image: '${AppCubit.get(context).homeModel!.pic}',
      containerWidth: size.width,
      containerHeight: size.height,
    );
    //   Scaffold(
    //   floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
    //     ,onPressed: ()
    //     {
    //       Navigator.pop(context);
    //     },
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    //   body: GestureDetector(
    //     child: Container(
    //       width: size.width,
    //       height: size.height,
    //       child: Stack(
    //         alignment: Alignment.center,
    //         children: [
    //             Center(child: Image(image: NetworkImage(
    //                 '${AppCubit.get(context).userModel!.image}'
    //             ),
    //             ),
    //             ),
    //         ],
    //       ),
    //     ),
    //     onTap: ()
    //     {
    //       Navigator.pop(context);
    //     },
    //   ),
    // );
  }
}