import 'package:flutter/material.dart';

import 'layout/todo_app/todo_layout.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
