import 'dart:io';

import 'package:contacts_app/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:ui' as ui;

Future<List<Face>> MlKit(Image image, int index) async {
  final options = FaceDetectorOptions();
  final faceDetector = FaceDetector(options: options);
  final List<Face> faces = await faceDetector
      .processImage(InputImage.fromFilePath(imageFileList![index].path));
  final length = faces.length;
  print(" $length faces found in this image");
  for (var i = 0; i < faces.length; i++) {
    
    print(faces[i].boundingBox);
  }

  return faces;
}
