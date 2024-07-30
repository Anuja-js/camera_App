import 'package:cameraapp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget {
  String tittle;
   CustomAppbar({required this.tittle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: CustumText(text: tittle,),
    );
  }
}