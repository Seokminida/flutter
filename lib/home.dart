import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
                          color: Colors.lightGreenAccent,
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Text("PICK FROM CAMERA!"),
                        )
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


}

