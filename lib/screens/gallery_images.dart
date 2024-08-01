import 'dart:io';
import 'package:flutter/material.dart';

class GalleryImages extends StatefulWidget {
  final String imagePath;

  const GalleryImages({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Images'),
      ),
      body: Center(
        child: widget.imagePath.isNotEmpty
            ? Image.file(
          File(widget.imagePath),
          fit: BoxFit.cover,
        )
            : Text('No Image Selected'),
      ),
    );
  }
}
