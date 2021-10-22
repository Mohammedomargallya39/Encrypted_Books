import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/books_model.dart';

class OnlineBooksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Online books'),
            ),
            body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index) => onlineBooksItem(BooksModel()),
                separatorBuilder:(context,index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                itemCount: 10),



          );
        },
      ),

    );
  }


  Widget onlineBooksItem(BooksModel model) => Column(
        children: [
          const SizedBox(height: 10.0,),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage("assets/images/life_book.jpg"),
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'كتاب حياتي ياعين',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.file_download))
              ],
            ),
          ),
          const SizedBox(height: 10.0,)
        ],
      );

}
