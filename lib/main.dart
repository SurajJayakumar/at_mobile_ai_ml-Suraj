import 'package:contacts_app/screens/mainScreen.dart';
import 'package:flutter/material.dart';


import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

