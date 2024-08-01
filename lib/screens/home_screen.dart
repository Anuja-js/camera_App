import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import '../constants/colors.dart';
import '../custom_widgets/custom_appbar.dart';
import 'gallery_images.dart';

class HomeScreen extends StatefulWidget {
  final Function imageSaves;
  HomeScreen(this.imageSaves);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;
  File? saveImages;

  void savedImage(File image) {
    saveImages = image;
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final picFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 600);
    if (picFile == null) {
      return;
    }
    setState(() {
      imageFile = File(picFile.path);
    });
    final apDir = await syspath.getApplicationSupportDirectory();
    final fileName = path.basename(picFile.path);
    final saveImagePath = await imageFile!.copy("${apDir.path}/$fileName");
    widget.imageSaves(saveImagePath);
  }

  void onSave() {
    if (saveImages != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GalleryImages(imagePath: saveImages!.path),
        ),
      );
    } else {
      // Handle the case where saveImages is null
      // For example, show a message to the user
      print("No image to save.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _takePicture();
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: CustomAppbar(
          tittle: 'MY GALLERY',
          icon: IconButton(
            onPressed: () {
              if (saveImages != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GalleryImages(imagePath: saveImages!.path),
                  ),
                );
              } else {
                // Handle null case
                print("No image to display.");
              }
            },
            icon: Icon(Icons.image, color: black, size: 25),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: green),
                borderRadius: BorderRadius.circular(5),
              ),
              child: imageFile != null
                  ? Image.file(
                imageFile!,
                fit: BoxFit.cover,
              )
                  : Center(child: Text("Add Image")),
            ),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  onSave();
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color?>(green)),
                icon: Icon(
                  Icons.check_circle_rounded,
                  color:black,
                ),
                label: Text(
                  "Add Image to Gallery",
                  style: TextStyle(color:black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
