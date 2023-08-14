import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

class CustomTapBar extends StatelessWidget {
  final String title;
  final String? iconName;
  final String? imageName;

  const CustomTapBar({
    super.key,
    required this.title,
    this.iconName,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: iconName != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (iconName != null)
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/images/$iconName.svg")),
            CustomText(
                text: title,
                textcolor: AppColors.mainBlack,
                fontsize: width * 0.06),
            (width * 0.04).sbw,
          ],
        ),
        (width * 0.05).sbh,
        if (imageName != null) SvgPicture.asset("assets/images/$imageName.svg"),
        (width * 0.04).sbh,
      ],
    );
  }
}
