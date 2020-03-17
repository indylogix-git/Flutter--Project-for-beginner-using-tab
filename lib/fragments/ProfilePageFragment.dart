import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfilePageFragment extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum AppState {
  free,
  picked,
  cropped,
}

enum ConfirmAction { CANCEL, ACCEPT }

class _ProfilePageState extends State
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  File _image;
  String profilePath;
  AppState state;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
//    downloadImage();
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(Icons.add_a_photo);
    else if (state == AppState.picked)
      return Icon(Icons.crop);
    else if (state == AppState.cropped)
      return Icon(Icons.clear);
    else
      return Container();
  }

  /* Image Select from gallery*/
  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {
      _image = image;
        print('Select image path' + _image.path.toString());
      });
    }
  }
  Future downloadImage() async {
    if (profilePath != null) {
      var image = new File(profilePath);
      setState(() {
        _image = image;
      });
    }
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 200);
//    return new Timer(_duration, navigationPage);
  }

  dismissDialog() {
    _controller.reverse();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 280.0,
                  width: double.infinity,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.orangeAccent,
                ),
                /*Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),*/
                Positioned(
                  top: 125.0,
                  left: 15.0,
                  right: 15.0,
                  child: Material(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
                    ),
                    child: Container(
                      height: 150.0,
                      /*  decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(7.0),
                           color: Colors.white),*/
                    ),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: (MediaQuery
                      .of(context)
                      .size
                      .width / 2 - 70.0),
                  child: Container(
                    child: new Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: new Stack(
                              fit: StackFit.loose, children: [
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Center(
                                  child: _image == null
                                      ? new Icon(Icons.camera_alt, color: Colors.grey, size: 140,)
                                      : new CircleAvatar(
                                    backgroundImage: new FileImage(_image),
                                    radius: 65.0,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, left: 90.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new FloatingActionButton(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: Colors.white,
                                      onPressed: ()  async {
                                        final ConfirmAction action = await _asyncConfirmDialog(context);
                                        print("Confirm Action $action" );

                                        /*if (state == AppState.free)
                                          _pickImage(true);*/
                                        /*else if (state == AppState.picked)
                                          _cropImage();
                                        else if (state == AppState.cropped)
                                          _clearImage();*/
                                      },
//                                      onPressed: getImage,
                                      tooltip: 'Pick Image',
                                      child: Icon(Icons.add_a_photo),
//                                      child: _buildButtonIcon(),
                                    ),
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 15.0,
                  right: 15.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bhanu Prakash Dave',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(height: 12.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.description,
                                color: Colors.grey, size: 20),
                            Text('Flutter developer Bhanu Prakash Dave',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey),
                            )
                          ])
                    ],
                  ),
                ),
              ],
            ),
            //TODO HERE CONTEXT ADD
          ],
        ));
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> _pickImage(bool isCamera) async {
//    File image;

    if (isCamera) {
      _image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    /*setState(() {
      _image = image;
    });*/

    if (_image != null) {
      setState(() {
//        state = AppState.picked;
        _cropImage();
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: _image.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      _image = croppedFile;
      setState(() {
        state = AppState.picked;
//        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    _image = null;
    setState(() {
      state = AppState.free;
    });
  }

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Flutter App'),
          content: const Text(
              'Select Image from'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CAMERA'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
                if (state == AppState.free)
                  _pickImage(true);
              },
            ),
            FlatButton(
              child: const Text('GALLERY'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
                if (state == AppState.free)
                  _pickImage(false);
              },
            )
          ],
        );
      },
    );
  }

  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

}