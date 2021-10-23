import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConnectUs extends StatelessWidget {
  const ConnectUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect Us'),
      ),
      body: Builder(builder: (BuildContext context)
      {
        return const WebView(
          initialUrl: 'https://mail.google.com/mail/u/0/#inbox?compose=new',
        );
      }),
    );
  }
}
