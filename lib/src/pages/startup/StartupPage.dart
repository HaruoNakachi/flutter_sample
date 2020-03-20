import 'package:flutter/material.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/src/pages/intro/IntroPage.dart'; 

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  Widget build(BuildContext context) {
     
    return IntroPage();
  }
}
