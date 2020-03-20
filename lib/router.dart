import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/pages/home/HomePage.dart';
import 'package:flutterapp/src/pages/post/DetailPostPage.dart'; 

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage()); 
    case '/post':
    return MaterialPageRoute(builder: (context) => DetailPostPage(data: settings.arguments)); 
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
