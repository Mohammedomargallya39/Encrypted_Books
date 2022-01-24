import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/cubit/cubit.dart';


class UserPDFBooksScreen extends StatelessWidget {

  final int bookId;
  bool night = true;
  bool light = false;
  //late BookId idToGetBook;


  UserPDFBooksScreen({Key? key ,required this.bookId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return  ConditionalBuilder(
          condition:  AppCubit.get(context).homeModel!.books![bookId].bookId!.pdf  != null,
          builder: (context) =>Scaffold(
            appBar: AppBar(
              title: Text(
                '${AppCubit.get(context).homeModel!.books![bookId].bookId!.name}',
              ),
            ),
            body:  PDF(
              nightMode: ThemeCubit.get(context).darkTheme? night : light ,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            ).cachedFromUrl(
              '${AppCubit.get(context).homeModel!.books![bookId].bookId!.pdf}',
              placeholder: (double progress) => Center(child: Text('$progress %')),
              errorWidget: (dynamic error) => Center(child: Text(error.toString())),
            ),
          ) ,
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

