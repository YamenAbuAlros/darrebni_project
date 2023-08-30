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
      this.onchanged,
      this.answer = false,
      this.fontSizeText, this.textColor, });

  final String text;
  final groupValue;
  final Color? activeColor;
  final value;
  
  final Color? textColor;
  final onchanged;
  final bool? answer;
  final double? fontSizeText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          activeColor: activeColor ?? AppColors.mainPurple1,
          groupValue: groupValue,
          onChanged: onchanged,
        ),
        answer == false
            ? CustomText(textcolor:textColor ,
                text: text,
                fontsize: fontSizeText ?? width * 0.0225,
              )
            : Expanded(
                child: CustomText(textcolor: textColor,
                text: text,
                fontsize: fontSizeText ?? width * 0.0225,
              ))
      ],
    );
  }
}
