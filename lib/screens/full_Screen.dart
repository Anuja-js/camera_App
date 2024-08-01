import 'dart:io';


import 'package:cameraapp/constants/colors.dart';
import 'package:cameraapp/models/class_model.dart';
import 'package:cameraapp/utils/database_helper.dart';
import 'package:cameraapp/utils/notifier.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {

  final Data data;
  FullScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  DatabaseHelper helper=DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      backgroundColor: white,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        actions: [
          IconButton(onPressed: (){
            helper.deleteData(widget.data.id!);
            RefreshNotifier().notifier.value = !RefreshNotifier().notifier.value;
            Navigator.of(context).pop();
          }, icon: Icon(Icons.delete,color: black,)),
          SizedBox(width: 20,)
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: black,
            )),
      ),
      body: Container(width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.file(File(widget.data.imagePath.toString(),),fit: BoxFit.cover,)),
    );
  }
}
