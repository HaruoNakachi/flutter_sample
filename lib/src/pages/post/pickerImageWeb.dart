import 'dart:convert'; 
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:universal_html/html.dart';

class PickerImageWeb extends StatefulWidget {
  PostModel data;
  PickerImageWeb({Key key, this.data}) : super(key: key);
  @override
  _CreateUpdatePostPageState createState() => _CreateUpdatePostPageState();
}

class _CreateUpdatePostPageState extends State<PickerImageWeb> {
 
  GlobalKey<FormState> _key = new GlobalKey();
  Uint8List _bytesImage;

  _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader = new FileReader();

        reader.onLoadEnd.listen((e) {
          widget.data.image = reader.result.toString().split(',')[1];
          setState(() {});
        });
        reader.readAsDataUrl(file);
      }
    });
  }

  Widget build(BuildContext context) {
    print(jsonEncode(widget.data));
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
