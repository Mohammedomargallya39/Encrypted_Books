import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'offlin_books_screen.dart';
import 'online_books_screen.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      const Text('Books'),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  width: double.infinity,
                  height: 55.55,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 17.5,
                    color: defaultColor,
                    onPressed: ()
                    {
                      navigateTo(context, OnlineBooksScreen());
                    },
                    child: const Text('Online Books',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 85.45),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  width: double.infinity,
                  height: 55.55,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    elevation: 17.5,
                    color: defaultColor,
                    onPressed: ()
                    {
                      navigateTo(context, OfflineBooksScreen());
                    },
                    child: const Text('Offline Books',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
