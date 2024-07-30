
import 'package:flutter/material.dart';

import '../constants/colors.dart';
// ignore: must_be_immutable
class CustumText extends StatelessWidget {
  String text;
  CustumText({required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Text(text,style: const TextStyle(color: black,fontSize: 15,fontWeight: FontWeight.w500,),);
  }
}