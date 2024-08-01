import 'package:cameraapp/constants/colors.dart';
import 'package:cameraapp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget {
  Widget? icon;
  String tittle;
   CustomAppbar({required this.tittle,this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: CustumText(text: tittle,colors: black,),centerTitle: true,
    leading: icon,
    );
  }
}