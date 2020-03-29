// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// pickerWeb(_bytesImage) {
//   _startFilePicker() async {
//     InputElement uploadInput = FileUploadInputElement();
//     uploadInput.click();
// uploadInput.onChange.listen((e) {
//   // read file content as dataURL
//   final files = uploadInput.files;
//   if (files.length == 1) {
//     final file = files[0];
//     final reader = new FileReader();

//     reader.onLoadEnd.listen((e) {
//        print(reader.result.toString().split(',')[1]);

//     });
//     reader.readAsDataUrl(file);
//   }
// });
//   }

//   return Container(
//       width: 200,
//       height: 200,
//       child: GestureDetector(
//         onTap: () => _startFilePicker(),
//         child: Image.memory(
//           _bytesImage,
//           fit: BoxFit.cover,
//         ),
//       ));
// }


// // pickerMobile(_bytesImage) {
// //     Future getImage() async {
// //     var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 400);
// //       _image = image;
// //       List<int> imageBytes = _image.readAsBytesSync();
// //       base64Image = base64.encode(imageBytes);
// //       _bytesImage = Base64Decoder().convert(base64Image);
// //   }


// //   return Container(
// //       width: 200,
// //       height: 200,
// //       child: GestureDetector(
// //         onTap: () => getImage(),
// //         child: Image.memory(
// //           _bytesImage,
// //           fit: BoxFit.cover,
// //         ),
// //       ));
// // }
