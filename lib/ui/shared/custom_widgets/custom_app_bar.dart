import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

import '../colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.iconName, required this.text, this.ontap});
  final String iconName;
  final String text;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/shapeMaker.svg',
          width: width,
        ),
        PositionedDirectional(
          top: height * 0.07,
          start: width * 0.05,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: ontap,
                child: SvgPicture.asset(
                  'assets/images/$iconName.svg',
                  color: AppColors.mainWhite,
                ),
              ),
              (width * 0.05).sbw,
              CustomText(
                text: text,
                textcolor: AppColors.mainWhite,
              ),
            ],
          ),
        )
      ],
    );
  }
}
