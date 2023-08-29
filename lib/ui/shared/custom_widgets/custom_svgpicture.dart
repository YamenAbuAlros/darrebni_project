// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/ui/shared/colors.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture(
      {super.key, this.color, required this.imagename, this.width});
  final Color? color;
  final String imagename;
  final width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$imagename.svg',
      color: color ?? AppColors.mainOrangeColor,
      width: width,
    );
  }
}
