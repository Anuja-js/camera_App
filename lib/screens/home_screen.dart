
import 'package:flutter/material.dart';

import '../custom_widgets/custom_appbar.dart';
import '../custom_widgets/custom_text.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,50),
          child:  CustomAppbar(tittle: 'IMAGES',)),

    );
  }
}



