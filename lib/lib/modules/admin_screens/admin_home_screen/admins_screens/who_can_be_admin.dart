import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';

import '../students_departments.dart';

class AddAdmins extends StatelessWidget {
  const AddAdmins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/main_top.png',
                  width: size.width * 0.35,),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('assets/images/login_bottom.png',
                  width: size.width * 0.4,),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    size.height * 0.13,
                    0,
                    0
                ),
                child: AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(_w / 30),
                    physics:
                    BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemCount: AppCubit.get(context).addAdminsModel!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          verticalOffset: -250,
                          child: ScaleAnimation(
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Container(
                              child: InkWell(
                                child: Row(
                                  children: <Widget>
                                  [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: size.width * .18,
                                      height:size.height * .07,
                                      decoration:   BoxDecoration(shape: BoxShape.circle,
                                        image: DecorationImage(image:
                                        NetworkImage(AppCubit.get(context).addAdminsModel![index].image!),
                                            fit: BoxFit.fill
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.001,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  <Widget>
                                        [
                                          Text(AppCubit.get(context).addAdminsModel![index].name! ,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold ,
                                              fontSize: size.width * 0.04,
                                            ),
                                          ),
                                          SizedBox(height: size.height * 0.0075,),
                                          Text(AppCubit.get(context).addAdminsModel![index].email!.split('@').first ,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold ,
                                              fontSize: size.width * 0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                                      child: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  AppCubit.get(context).makeAdmin(
                                      studentId: AppCubit.get(context).addAdminsModel![index].sId!
                                  );
                                  showToast(message: '${AppCubit.get(context).addAdminsModel![index].email!.split('@').first} is admin now', state: ToastStates.SUCCESS);
                                  navigateAndEnd(context, StudentsDepartmentsScreen());
                                },
                              ) ,
                              margin: EdgeInsets.only(bottom: _w / 20),
                              height: _w / 4,
                              decoration: BoxDecoration(
                                color: ThemeCubit.get(context).darkTheme?Colors.grey.shade700:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
