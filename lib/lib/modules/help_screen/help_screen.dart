import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/lib/modules/help_screen/connect_us.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Help'),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17.5,22,17.5,0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
             <Widget>
            [
              const SizedBox(
                width: double.infinity,
                child: Text('If you have any issue while using our app, you have to contact us by sending a mail to us to solve this problem at top speed. '
                    'send mail to mohammed.gallya39@gmail.com',
                  maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 19,),),
              ),
              const SizedBox(height: 30,),
              TextButton(
                  onPressed: ()
                  {
                   navigateTo(context, const ConnectUs());
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
