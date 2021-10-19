import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_feed_ui_redesign/screens/api.dart';
import 'package:image_picker/image_picker.dart';

File _image;
String url;

class ImageFromGalleryEx extends StatefulWidget {
  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState();
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        File image = await ImagePicker.pickImage(
                            source: ImageSource.gallery, imageQuality: 50);
                        setState(() {
                          _image = image;
                        });
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.camera, imageQuality: 50);
                      setState(() {
                        _image = File(image.path);
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xFFFFCDD2),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.pink[400],
                        ),
                      ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                hintText: 'Enter your post title',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                hintText: 'Enter your post description',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text(
                'Create',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.red[100],
              onPressed: () {
                createPost("title", "description", url, 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
