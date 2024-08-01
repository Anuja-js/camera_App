import 'package:cameraapp/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (ctx) => HomeScreen(),

      },
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
    );
  }
}
