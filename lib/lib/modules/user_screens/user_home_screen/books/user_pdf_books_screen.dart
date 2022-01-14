import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/cubit.dart';


class UserPDFBooksScreen extends StatelessWidget {

  final dynamic bookId;
  bool night = true;
  bool light = false;
  get index => index;

  UserPDFBooksScreen({Key? key ,this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return  ConditionalBuilder(
          condition: AppCubit.get(context).homeModel!.books![index].bookInfo! != null,
          builder: (context) =>Scaffold(
            appBar: AppBar(
              title: Text(
                  AppCubit.get(context).homeModel!.books![index].bookInfo!.name!
              ),
            ),
            body:  PDF(
              nightMode: ThemeCubit.get(context).darkTheme? night : light ,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            ).cachedFromUrl(
              AppCubit.get(context).homeModel!.books![index].bookInfo!.pdf!,
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

