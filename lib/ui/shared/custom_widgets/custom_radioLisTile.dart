import 'package:flutter/material.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/utils.dart';

import '../colors.dart';

class CustomRadioLisTile extends StatelessWidget {
  const CustomRadioLisTile(
      {super.key,
      required this.text,
      this.groupValue,
      this.activeColor,
      this.value,
      this.onchanged});

  final String text;
  final groupValue;
  final Color? activeColor;
  final value;
  final onchanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          activeColor: activeColor ?? AppColors.mainPurple1,
          groupValue: groupValue,
          onChanged: onchanged,
        ),
        CustomText(
          text: text,
          fontsize: width * 0.0225,
        ),
      ],
    );
  }
}
