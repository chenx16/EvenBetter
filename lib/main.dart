import 'package:flutter/material.dart';
import 'package:flutter_instagram_feed_ui_redesign/screens/feed_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Even Better',
      debugShowCheckedModeBanner: false,
      home: FeedScreen(),
    );
  }
}
