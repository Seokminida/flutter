import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url1 = 'http://ncov.mohw.go.kr/';
const String _url2 = 'https://www.mohw.go.kr/react/popup_200128.html';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Container(
            child: _image == null
                ? Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Text("PICK FROM GALLERY"),
                        ),
                        Container(
                          height: 40.0,
                        ),
                        RaisedButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Text("test"),
                        ),
                        Container(
                          height: 40.0,
                        ),
                        RaisedButton(
                          color: Colors.lightGreenAccent,
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Text("PICK FROM CAMERA!"),
                        ),
                        Container(
                          height: 40.0,
                        ),
                        RaisedButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            _launchURL1();
                          },
                          child: Text("The current status of COVID-19."),
                        ),
                        Container(
                          height: 40.0,
                        ),
                        RaisedButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            _launchURL2();
                          },
                          child: Text("COVID-19 Screening Clinic."),
                        ),
                        Container(
                          height: 40.0,
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  )));
  }

  Widget showImage() {
    if (_image == null)
      return Container();
    else
      return Image.file(_image!);
  }

  Future getImage(ImageSource imageSource) async {
    ImagePicker p = ImagePicker();
    var image = await p.pickImage(source: imageSource);

    setState(() {
      _image = image as File;
    });
  }

  void _launchURL1() async {
    if (!await launch(_url1)) throw 'Could not launch $_url1';
  }

  void _launchURL2() async {
    if (!await launch(_url2)) throw 'Could not launch $_url2';
  }
}
