import 'package:flutter/material.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/utils.dart';

import '../../../core/utilis/general_util.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.textcolor,
      this.fontsize,
      this.fontWeight,
      this.isDecoration = false});
  final String text;
  final double? fontsize;
  final Color? textcolor;
  final bool isDecoration;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: storage.getAppLanguage() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      text,
      textAlign: TextAlign.right,
      maxLines: null,
      overflow: TextOverflow.visible,
      // maxLines: 1,
      style: TextStyle(
          // fontFamily: 'Alexandria-Regular',
          decoration: isDecoration ? TextDecoration.underline : null,
          color: textcolor ?? AppColors.mainPurple1,
          // ignore: prefer_if_null_operators
          fontSize: fontsize ?? width * 0.035,
          // ignore: prefer_if_null_operators
          fontWeight: fontWeight ?? FontWeight.w300),
    );
  }
}
