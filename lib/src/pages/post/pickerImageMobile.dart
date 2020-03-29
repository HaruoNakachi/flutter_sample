import 'dart:convert'; 
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:image_picker/image_picker.dart';

class PickerImageMobile extends StatefulWidget {
  PostModel data;
  PickerImageMobile({Key key, this.data}) : super(key: key);
  @override
  _CreateUpdatePostPageState createState() => _CreateUpdatePostPageState();
}

class _CreateUpdatePostPageState extends State<PickerImageMobile> {
 
  GlobalKey<FormState> _key = new GlobalKey();
  Uint8List _bytesImage; 

  Future _startFilePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 400);  
      List<int> imageBytes = image.readAsBytesSync();
      widget.data.image = base64.encode(imageBytes); 
      setState(() {
        
      });
  }

  Widget build(BuildContext context) { 
    if (widget.data.image != null) {
      _bytesImage = Base64Decoder().convert(widget.data.image);
    }
    if (widget.data.image == null) {
      _bytesImage = Base64Decoder().convert(base64ImageDefault);
    }
    return Container(
        width: 200,
        height: 200,
        child: GestureDetector(
          onTap: () => _startFilePicker(),
          child: Image.memory(
            _bytesImage,
            fit: BoxFit.cover,
          ),
        ));
  }
}
