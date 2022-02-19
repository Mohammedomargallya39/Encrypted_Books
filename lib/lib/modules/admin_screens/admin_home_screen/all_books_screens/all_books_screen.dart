// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social/lib/cubit/cubit.dart';
// import 'package:social/lib/cubit/states.dart';
// import 'package:social/lib/models/admin_books_model.dart';
// import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/all_pdf_book_screen.dart';
// import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/upload_book_screen.dart';
// import 'package:social/lib/shared/components/components.dart';
//
// import 'search_book_screen/search_book_screen.dart';
//
// class AdminBooksScreen extends StatelessWidget {
//   const AdminBooksScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit,AppStates>(
//         listener: (context, state) {},
//         builder: (context, state)
//         {
//           var cubit = AppCubit.get(context);
//           return ConditionalBuilder(
//             condition: cubit.adminBooksModel != null,
//             builder: (context) =>  Scaffold(
//               appBar: AppBar(
//                 title: const Text('Books'),
//                 actions: [
//                   IconButton(
//                     onPressed: ()
//                     {
//                       navigateTo(context, UploadBookScreen());
//                     },
//                     icon: const Icon(Icons.upload_rounded),
//                   ),
//                   IconButton(
//                     onPressed: (){
//                       navigateTo(context, CsBookSearchScreen());
//                     },
//                     icon: const Icon(Icons.search_outlined),
//                   ),
//                 ],
//               ),
//               body: ListView.separated(
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context,index) {
//                   //AppCubit.get(context).indexBook = index;
//                   return  InkWell(
//                     child: adminBooksItem(AdminBooksDetails(
//                       name:cubit.adminBooksModel!.books![index].name ,
//                       cover:cubit.adminBooksModel!.books![index].cover ,
//                     ) , context),
//                     onTap: ()
//                     {
//                       navigateTo(context, AdminPDFBooksScreen(
//                           BookId: index
//                       ),
//                       );
//                     },
//                   );
//                 },
//                 separatorBuilder:(context,index)=> Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 1.0,
//                     width: double.infinity,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 itemCount:cubit.adminBooksModel!.books!.length,
//               ),
//             ),
//             fallback: (context) => Scaffold(
//               body: Center(
//                   child: Text('No Books added yet.',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ),
//             ),
//           );
//         },
//       );
//   }
//   Widget adminBooksItem(AdminBooksDetails books , context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//        SizedBox(height: size.height * 0.015),
//         Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Image(
//                 image: NetworkImage(
//                     books.cover!
//                 ),
//                 width: size.width,
//                 height: size.height *0.15,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: size.height * 0.015),
//         Row(
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   books.name!,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // TextButton(onPressed: ()
//         // {
//         //   showDialog(context: context,
//         //       builder: (context) => DeleteBooksAlertDialog(
//         //         description: 'Delete This Book',
//         //         title: 'Are you sure?'
//         //         ,)
//         //     ,);
//         // },
//         //   child: Text('Delete this book',
//         //   style: TextStyle(
//         //     fontWeight: FontWeight.bold,
//         //     fontSize: 18,
//         //     color: Colors.red,
//         //   ),
//         // ),
//         // ),
//       ],
//     );
//   }
//   // Widget addStudentToBooksItem(StudentsModel studentsAddModel , context) => Row(
//   //   mainAxisAlignment: MainAxisAlignment.start,
//   //   children: <Widget>
//   //   [
//   //     Container(
//   //       margin: const EdgeInsets.all(10),
//   //       width: 75,
//   //       height:75,
//   //       decoration:  BoxDecoration(shape: BoxShape.circle,
//   //         image: DecorationImage(image:
//   //         NetworkImage(
//   //             studentsAddModel.image!
//   //             ),
//   //             fit: BoxFit.fill,
//   //         ),
//   //       ),
//   //     ),
//   //     Column(
//   //       children:  <Widget>
//   //       [
//   //         SizedBox(
//   //           width: 300,
//   //           child: Text(
//   //             studentsAddModel.name! ,
//   //             maxLines: 1,
//   //             overflow: TextOverflow.ellipsis,
//   //             style: TextStyle(
//   //               fontWeight: FontWeight.bold ,
//   //               fontSize: 22.22 ,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: 5,),
//   //         SizedBox(
//   //           width: 300,
//   //           child: Text(
//   //             studentsAddModel.email!.split('@').first ,
//   //             maxLines: 1,
//   //             overflow: TextOverflow.ellipsis,
//   //             style: TextStyle(
//   //               fontWeight: FontWeight.bold ,
//   //               fontSize: 22.22 ,
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //     Spacer(),
//   //     IconButton(onPressed: ()
//   //     {
//   //
//   //     },
//   //         icon: Icon(Icons.add) )
//   //   ],
//   // );
//   // Widget removeStudentToBooksItem(StudentsModel studentsRemoveModel , context) => Row(
//   //   mainAxisAlignment: MainAxisAlignment.start,
//   //   children: <Widget>
//   //   [
//   //     Container(
//   //       margin: const EdgeInsets.all(10),
//   //       width: 75,
//   //       height:75,
//   //       decoration: BoxDecoration(shape: BoxShape.circle,
//   //         image: DecorationImage(image:
//   //         NetworkImage(
//   //           studentsRemoveModel.image!
//   //            ),
//   //             fit: BoxFit.fill
//   //         ),
//   //       ),
//   //     ),
//   //     Column(
//   //       children:  <Widget>
//   //       [
//   //         SizedBox(
//   //           width: 300,
//   //           child: Text(
//   //             studentsRemoveModel.name! ,
//   //             maxLines: 1,
//   //             overflow: TextOverflow.ellipsis,
//   //             style: TextStyle(
//   //               fontWeight: FontWeight.bold ,
//   //               fontSize: 22.22 ,
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: 5,),
//   //         SizedBox(
//   //           width: 300,
//   //           child: Text(
//   //             studentsRemoveModel.email!.split('@').first ,
//   //             maxLines: 1,
//   //             overflow: TextOverflow.ellipsis,
//   //             style: TextStyle(
//   //               fontWeight: FontWeight.bold ,
//   //               fontSize: 22.22 ,
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //     Spacer(),
//   //     IconButton(onPressed: ()
//   //     {
//   //
//   //     },
//   //         icon: Icon(Icons.remove) )
//   //   ],
//   // );
// }
// // class DeleteBooksAlertDialog extends StatefulWidget {
// //   const DeleteBooksAlertDialog({
// //     Key? key,
// //     required this.title,
// //     required this.description,
// //   }) : super(key: key);
// //
// //   final String title, description;
// //
// //   @override
// //   _DeleteBooksAlertDialogState createState() => _DeleteBooksAlertDialogState();
// // }
// // class _DeleteBooksAlertDialogState extends State<DeleteBooksAlertDialog> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Dialog(
// //       elevation: 0,
// //       //backgroundColor: Color(0xffffffff),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15.0),
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           SizedBox(height: 15),
// //           Text(
// //             "${widget.title}",
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontSize: 22.0,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           SizedBox(height: 22),
// //           Text("${widget.description},",
// //             style: TextStyle(
// //               fontSize: 22.0,
// //               color: Colors.black,
// //               fontWeight: FontWeight.bold,
// //             ),),
// //           SizedBox(height: 20),
// //           Divider(
// //             height: 1,
// //           ),
// //           Container(
// //             width: MediaQuery.of(context).size.width,
// //             height: 50,
// //             child: InkWell(
// //               highlightColor: Colors.grey[200],
// //               onTap: ()
// //               {
// //                 AppCubit.get(context).deleteBooks();
// //                 showToast(
// //                     message: 'Book deleted successfully',
// //                     state: ToastStates.SUCCESS );
// //                 navigateAndEnd(context, AdminHomeScreen(),);
// //
// //               },
// //               child: Center(
// //                 child: Text(
// //                   "Yes",
// //                   style: TextStyle(
// //                     fontSize: 18.0,
// //                     color:Colors.red,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Divider(
// //             height: 1,
// //           ),
// //           Container(
// //             width: MediaQuery.of(context).size.width,
// //             height: 50,
// //             child: InkWell(
// //               borderRadius: BorderRadius.only(
// //                 bottomLeft: Radius.circular(15.0),
// //                 bottomRight: Radius.circular(15.0),
// //               ),
// //               highlightColor: Colors.grey[200],
// //               onTap: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Center(
// //                 child: Text(
// //                   "Cancel",
// //                   style: TextStyle(
// //                     color: Colors.black,
// //                     fontSize: 16.0,
// //                     fontWeight: FontWeight.normal,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/search_book_screen/search_book_screen.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/all_books_screens/upload_book_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'all_pdf_book_screen.dart';

class AdminBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 60,
            right: 0,
            child: IconButton(icon: Icon(Icons.search_outlined), onPressed: ()
            {
              navigateTo(context, CsBookSearchScreen());
            }, iconSize: 30,
            ),
          ),
          Positioned(
            top: 60,
            right: 60,
            child: IconButton(icon: Icon(Icons.upload_rounded), onPressed: ()
            {
              navigateTo(context, UploadBookScreen());
            }, iconSize: 30,
            ),
          ),
          Positioned(
            top: 60,
            left: 30,
            child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()
            {
              Navigator.pop(context);
            }, iconSize: 23,
            ),
          ),
        ],
      ),

      body: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: AppCubit.get(context).adminBooksModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 99, 0, 0),
              child: AnimationLimiter(
                child: GridView.count(
                  physics:
                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    AppCubit.get(context).adminBooksModel!.books!.length,
                        (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: Duration(milliseconds: 1200),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          scale: 1.5,
                          child: FadeInAnimation(
                            child: Container(
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Image(image: NetworkImage(
                                      AppCubit.get(context).adminBooksModel!.books![index].cover!,
                                    ),
                                      height: size.height * 0.123,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox( height: size.height *0.006
                                      ,),
                                    Text(
                                      AppCubit.get(context).adminBooksModel!.books![index].name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color:  Colors.black ,
                                      ),
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: double.infinity,
                                      color: Colors.grey.withOpacity(0.5555),
                                    ),
                                    Text(
                                      AppCubit.get(context).adminBooksModel!.books![index].description!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color:  Colors.black ,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  navigateTo(context, AdminPDFBooksScreen(
                                      BookId: index
                                  ),
                                  );
                                },
                              ),
                              margin: EdgeInsets.only(
                                  bottom: _w / 30, left: _w / 60, right: _w / 60),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}