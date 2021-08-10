import 'package:flutter/material.dart';
import 'package:providder/screen/book_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BookScreen()
      },
    );
  }
}

