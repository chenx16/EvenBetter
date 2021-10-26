import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Even Better',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
        //<Widget>[]
        backgroundColor: Colors.pinkAccent[100],
        elevation: 20.0,
        //IconButton
        brightness: Brightness.dark,
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.pinkAccent[100],
                    Colors.pinkAccent[200]
                  ])),
              child: Container(
                width: double.infinity,
                height: 300.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Yolanda White",
                        style: TextStyle(
                          fontFamily: 'EB',
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        color: Colors.red[400],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        fontSize: 18.0,
                                        color: Colors.red[300],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Followers",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        color: Colors.red[400],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        fontSize: 18.0,
                                        color: Colors.red[300],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Follow",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        color: Colors.red[400],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        fontSize: 18.0,
                                        color: Colors.red[300],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Company",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        color: Colors.red[400],
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Google",
                                      style: TextStyle(
                                        fontFamily: 'EB',
                                        fontSize: 18.0,
                                        color: Colors.red[300],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Bio:",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'EBI',
                        fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 0.0,
                  ),
                  Text(
                    'My name is Yolanda and I have graduated from Rose-Hulman CS major for 10 years.\n'
                    'if you need any mobile app for your company then contact me for more informations.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'EB',
                      color: Colors.black87,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            width: 200.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.redAccent[100],
                          Colors.pinkAccent[100]
                        ]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontFamily: 'EB',
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
