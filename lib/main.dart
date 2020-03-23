import 'package:flutter/material.dart';
import 'package:flutterapp/root.dart';

void main() async {
  print("Initializing.");
  WidgetsFlutterBinding.ensureInitialized();
  await Future<void>.delayed(Duration(seconds: 2));
  print("Done.");

  runApp(MyApp());
}