import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';


class AdminHelpScreen extends StatelessWidget {
  const AdminHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Help'),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17.5,22,17.5,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
             <Widget>
            [
              const SizedBox(
                width: double.infinity,
                child: Text('If you have any issue while using our app, you have to contact us by sending a mail to us to solve this problem at top speed. ',
                  maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 19,),),
              ),
              const SizedBox(height: 30,),
              TextButton(
                  onPressed: ()
                  {
                    launch('mailto:mohammed.gallya39@gmail.com?'
                        'subject=This is Subject title'
                        'body = This is Body Email');
                  },
                  child: const Text('Connect Us',
                    style: TextStyle(
                      color: defaultColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
