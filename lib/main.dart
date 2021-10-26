import 'package:flutter/material.dart';
import 'package:even_better/post/feed_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
        dividerColor: Colors.black,
      ),
      title: 'Even Better',
      home: FeedScreen(),
    );
  }
}
