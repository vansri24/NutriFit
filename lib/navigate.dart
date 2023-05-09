// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyNavigate extends StatefulWidget {
  const MyNavigate({Key? key}) : super(key: key);

  @override
  _MyNavigateState createState() => _MyNavigateState();
}

class _MyNavigateState extends State<MyNavigate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/module.png'), fit: BoxFit.cover),
      ),
    );
  }
}