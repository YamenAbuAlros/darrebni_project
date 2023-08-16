import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../utils.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, this.color, required this.text, this.iconName, this.ontap});
  final Color? color;
  final String text;
  final String? iconName;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    width: width * 0.005,
                    color: color ?? AppColors.mainPurple1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: text, textcolor: color ?? AppColors.mainPurple1),
            if (iconName != null)
              InkWell(
                onTap: ontap,
                child: SvgPicture.asset(
                  'assets/images/$iconName.svg',
                  color: color ?? AppColors.mainPurple1,
                ),
              )
          ],
        ));
  }
}
