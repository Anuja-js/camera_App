import 'package:cameraapp/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.imageSaves}) : super(key: key);

  final Function? imageSaves;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (ctx) => HomeScreen(imageSaves ?? (image) {}),

      },
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
    );
  }
}
