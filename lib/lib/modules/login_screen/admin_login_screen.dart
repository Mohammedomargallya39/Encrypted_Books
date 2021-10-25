import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Admin Login'),
      ),
    );
  }
}
