import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^

void createPost(title, description, url, likes) {
  _createPost(title, description, url, likes);
  print("post url ${url}");
}

Future<http.Response> _createPost(title, description, url, likes) {
  print("Even better username: ");
  return http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/posts/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "_id": "0000000000001",
      "title": title,
      "description": description,
      "picture-uri": url,
      "likes": 0.toString(),
      "__v": 0.toString()
    }),
  );
}
