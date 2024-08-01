import 'dart:io';
import 'package:cameraapp/constants/colors.dart';
import 'package:cameraapp/screens/full_Screen.dart';
import 'package:cameraapp/screens/home_screen.dart';
import 'package:cameraapp/utils/database_helper.dart';
import 'package:cameraapp/utils/notifier.dart';
import 'package:flutter/material.dart';

import '../models/class_model.dart';

class GalleryImages extends StatefulWidget {
  const GalleryImages({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  DatabaseHelper helper = DatabaseHelper();
  List<Data> images = [];
  @override
  void initState() {
    RefreshNotifier().notifier.addListener(getimagelist);
    getimagelist();
    super.initState();
  }
@override
  void dispose() {
  RefreshNotifier().notifier.removeListener(getimagelist);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: green,
          title: const Text(
            'Gallery Images',
            style: TextStyle(color: black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (ctx) {
                  return HomeScreen();
                }));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: black,
              )),
        ),
        body: images.length == 0
            ? const Text(
                "No Images Found",
                style: TextStyle(color: black),
              )
            : GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int position) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return FullScreen(
                          data: images[position],
                        );
                      }));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Image.file(
                            File(images[position].imagePath.toString()))),
                  );
                }));
  }

  void getimagelist() async {
    images = await helper.getDataList();
    print(images.length);
    setState(() {});
  }
}
