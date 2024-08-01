
import 'package:flutter/material.dart';

import '../constants/colors.dart';
// ignore: must_be_immutable
class CustumText extends StatelessWidget {
  Color?colors;
  String text;
  CustumText({required this.text,this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Text(text,style:  TextStyle(color: colors,fontSize: 15,fontWeight: FontWeight.w500,),);
  }
}