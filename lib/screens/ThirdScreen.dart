import 'package:contacts_app/screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/screens/mlKit.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class ThirdScreen extends StatelessWidget {
  final List<Face> faces;
  
  final Image image;

  const ThirdScreen({Key? key,required this.faces,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: CustomPaint(
                painter: FacePainter(faces,image),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class FacePainter extends CustomPainter {
  final List<Face> faces;
  final List<Rect> box=[];
  
  final Image image;
  FacePainter(this.faces,this.image) {
    for (var i = 0; i < faces.length; i++) {
      box.add(faces[i].boundingBox);
    }
  }

  @override
  void paint (Canvas canvas, Size size) {
     final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.yellow;
  
   for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(box[i], paint);
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

  }
  

