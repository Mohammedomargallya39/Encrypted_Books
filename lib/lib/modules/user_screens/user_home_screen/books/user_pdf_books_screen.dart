import 'dart:async';
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
  final StreamController<String> _pageCountController =
  StreamController<String>();

  UserPDFBooksScreen({Key? key ,required this.bookId}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  ConditionalBuilder(
          condition:  AppCubit.get(context).homeModel!.books![bookId].pdf  != null,
          builder: (context) =>Scaffold(
            floatingActionButton: Stack(
              // fit: StackFit.expand,
              children: [
                Positioned(
                  top: 80,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.headset_mic_outlined), onPressed: ()
                  {
                    AppCubit.get(context).ocrBookText(
                        bookId: '${AppCubit.get(context).homeModel!.books![bookId].sId}',
                        pageNumber: '${AppCubit.get(context).currentPage}'
                    );
                  },
                    iconSize: 23,
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
            body:  PDF(
              nightMode: ThemeCubit.get(context).darkTheme? night : light ,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onPageChanged: (int? current , int? total) async
              {
               _pageCountController.add('${current! + 1} - $total');
               AppCubit.get(context).currentPage = current;
               print('Current page is ${current}');
               print('Current page is ${AppCubit.get(context).currentPage}');

               print(total);
              },
            ).cachedFromUrl(
              '${AppCubit.get(context).homeModel!.books![bookId].pdf}',
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