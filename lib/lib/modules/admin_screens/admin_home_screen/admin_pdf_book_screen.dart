import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/cubit/cubit.dart';

import 'admin_home_screen.dart';


class AdminPDFBooksScreen extends StatelessWidget {

  //String url = 'http://africau.edu/images/default/sample.pdf';
  bool night = true;
  bool light = false;
  final int BookId;

  AdminPDFBooksScreen({Key? key, required this.BookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).adminBooksModel != null,
          builder:(context) =>  Scaffold(
            appBar: AppBar(
              title:Text(
                  AppCubit.get(context).adminBooksModel!.books![BookId].name!
              ),
              actions: [
                IconButton(
                  color: Colors.red,
                  onPressed: ()
                  {
                    AppCubit.get(context).indexBook= BookId;
                    showDialog(
                      context: context,
                      builder: (context) =>
                          DeleteBooksAlertDialog(
                            title: 'Delete This Book',
                            description: 'Are you sure?',
                            //StudentIDToDelete: StudentId,
                          ),
                    );
                  },
                  icon: const Icon(Icons.delete_forever),
                ),
              ],
            ),
            body:  PDF(
              nightMode: ThemeCubit.get(context).darkTheme? night : light ,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            ).cachedFromUrl(
              AppCubit.get(context).adminBooksModel!.books![BookId].pdf!
              ,
              placeholder: (double progress) => Center(child: Text('$progress %')),
              errorWidget: (dynamic error) => Center(child: Text(error.toString())),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class DeleteBooksAlertDialog extends StatefulWidget {
  const DeleteBooksAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  _DeleteBooksAlertDialogState createState() => _DeleteBooksAlertDialogState();
}
class _DeleteBooksAlertDialogState extends State<DeleteBooksAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      //backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 22),
          Text("${widget.description},",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 20),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: ()
              {
                AppCubit.get(context).deleteBooks();
                showToast(
                    message: 'Book deleted successfully',
                    state: ToastStates.SUCCESS );
                navigateAndEnd(context, AdminHomeScreen(),);

              },
              child: Center(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

