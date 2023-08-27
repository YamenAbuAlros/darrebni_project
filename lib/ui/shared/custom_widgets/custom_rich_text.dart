import 'package:flutter/material.dart';

import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/utils.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.ontap});
  final String text1, text2;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: text1,
          textcolor: AppColors.mainBlack,
        ),
        InkWell( highlightColor:AppColors.transparent, // تعيين لون اللزن أثناء التأشير

          onTap: ontap,
          child: SizedBox(height: height*0.05,
            child: Center(
              child: CustomText(
                text: text2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
