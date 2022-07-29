import 'dart:io';
import 'package:contacts_app/screens/ThirdScreen.dart';
import 'package:contacts_app/screens/mlKit.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/screens/mainScreen.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RouteTwo extends StatelessWidget {
  RouteTwo({Key? key, required this.image, required this.index})
      : super(key: key);
  final Image image;
  final int index;
  late int count = index + 1;
  late List<Face> faces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: image,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "Image $count",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.black),
            child: Text("Run facial detection"),
            onPressed: () {
              faces = MlKit(image, index) as List<Face>;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.black),
            child: Text("Show borders around faces"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (
                    (context) => ThirdScreen(
                        faces: faces,
                        image: Image.file(
                          File(imageFileList![index].path),
                        ),
                      )
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
