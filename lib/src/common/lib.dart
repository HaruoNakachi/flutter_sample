import 'package:flutter/material.dart';
import 'package:flutterapp/generated/app_localizations.dart';

showSnackBar(String title) {
  return SnackBar(
    backgroundColor: Colors.grey[850],
    content: Text(
      title,
      style: TextStyle(color: Colors.white60),
    ),
    action: SnackBarAction(
      textColor: Colors.white60,
      label: 'Đóng',
      onPressed: () { 
      },
    ),
  );
}

