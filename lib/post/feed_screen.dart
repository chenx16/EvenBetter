import 'dart:io';

import 'package:even_better/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:even_better/models/post_model.dart';
import 'package:even_better/post/addpost.dart';
//import 'package:flutter_instagram_feed_ui_redesign/screens/postpage.dart';
import 'package:even_better/post/view_post_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _hasBeenPressed = false;

  Image getImage(int index) {
    String s = posts[index].authorImageUrl;
    print(s);
    return Image.file(
      File(s),
      width: 50.0,
      height: 50.0,
      fit: BoxFit.cover,
    );
  }

  Widget _buildPost(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                            child:

                                //         Image.file(
                                //   File(
                                //       '/data/user/0/com.example.test/cache/image_picker6576687268720922497.jpg'),
                                //   width: 50.0,
                                //   height: 50.0,
                                //   fit: BoxFit.cover,
                                // )
                                getImage(index)),
                      ),
                    ),
                    title: Text(
                      posts[index].authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(posts[index].timeAgo),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () => print('More'),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: () => print('Like post'),
                                ),
                                const Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.chat),
                                  iconSize: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewPostScreen(
                                          post: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Text(
                                  '350',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch (_index) {
      case 0:
        child = _postHome();
        break;

      case 4:
        child = ProfileApp();
        break;
    }
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      bottomNavigationBar: _bottomTab(),
      body: SizedBox.expand(child: child),
    );
  }

  Widget _bottomTab() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),
        //backgroundColor: Colors.deepPurple,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 30.0,
              color: Colors.grey,
            ),
            title: Text(''),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.grey,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFFF8BBD0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageFromGalleryEx()));
                },
                child: const Icon(
                  Icons.add,
                  size: 35.0,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(''),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 30.0,
              color: Colors.grey,
            ),
            title: Text(''),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30.0,
              color: Colors.grey,
            ),
            title: Text(''),
          ),
        ],
      ),
    );
  }

  Widget _postHome() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Even Better',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 35.0,
                  color: Color(0xFFF48FB1),
                ),
              ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 16.0),
                  SizedBox(
                    width: 35.0,
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      iconSize: 30.0,
                      onPressed: () => print('Direct Messages'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        _buildPost(0),
        _buildPost(1),
      ],
    );
  }
}
