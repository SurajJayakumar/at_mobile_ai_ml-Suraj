import 'package:contacts_app/screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';




List<XFile>? imageFileList = [];
int index = 0;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future pickImages() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickMultiImage();
      if (image == null) return;
      imageFileList!.addAll(image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    if (!mounted) return;
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Choose photos from gallery'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.black),
              child: Text("Choose image from gallery"),
              onPressed: () {
                pickImages();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, index) {
                    final count=index+1;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RouteTwo(
                              image:  Image.file(
                                File(imageFileList![index].path),),
                              index: index,
                            
                          ),
                        ));
                      },
                      child: Container(
                        child: Image.file(File(imageFileList![index].path),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                  itemCount: imageFileList!.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
