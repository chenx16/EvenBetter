import 'dart:io';
import 'package:flutter/material.dart';
import 'package:even_better/screens/api.dart';
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Even Better"),
        //<Widget>[]
        backgroundColor: Colors.pinkAccent[100],
        elevation: 50.0,
        //IconButton
        brightness: Brightness.dark,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFFFCDD2),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
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
                          color: Colors.redAccent[200],
                        ),
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _descriptionTile(),
                  SizedBox(height: 30),
                  _contentTile(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: TextButton(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
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

Widget _descriptionTile() {
  return ListTileTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      tileColor: Colors.grey[200],
      leading: Icon(Icons.edit),
      title: Text(
        'Post Title',
        style: TextStyle(height: 2, color: Colors.grey[800], fontSize: 18.0),
      ),
      subtitle: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter...',
        ),
        maxLines: 1,
      ),
    ),
  );
}

Widget _contentTile() {
  return ListTileTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      tileColor: Colors.grey[200],
      leading: Icon(Icons.edit),
      title: Text(
        'Post Content',
        style: TextStyle(height: 2, color: Colors.grey[800], fontSize: 18.0),
      ),
      subtitle: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter...',
        ),
        maxLines: 5,
      ),
    ),
  );
}
