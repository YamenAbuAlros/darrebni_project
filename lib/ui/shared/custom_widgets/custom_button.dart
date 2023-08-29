import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.onPressed,
    this.imageName,
    this.paddingLR,
    this.widthSize,
    this.heightSize,
    this.isBackgroundColor = true,
    this.selectedChild = false,
    this.isPrefix = false,
  });

  final String text;
  final bool selectedChild;
  final String? imageName;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? paddingLR;
  final double? widthSize, heightSize;
  final bool isBackgroundColor;
  final bool isPrefix;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.02)),
          backgroundColor: isBackgroundColor
              ? (backgroundColor ?? AppColors.mainPurple1)
              : null,
          side: borderColor != null
              ? BorderSide(
                  width: 1.0, color: borderColor ?? AppColors.mainWhiteColor)
              : null,
          maximumSize: Size(widthSize ?? width, heightSize ?? height * 0.07),
          minimumSize:
              Size(widthSize ?? width * 0.01, heightSize ?? height * 0.07),
        ),
        child: selectedChild
            ? Row(
                children: [
                  if (isPrefix) SvgPicture.asset('assets/images/ic_book.svg'),
                  (width * 0.03).sbw,
                  CustomText(text: text),
                  const Spacer(),
                  SvgPicture.asset('assets/images/ic_arrow.svg'),
                ],
              )
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (imageName != null) ...[
                  SvgPicture.asset(
                    'assets/images/$imageName.svg',
                    width: width * 0.09,
                  ),
                  SizedBox(width: width * 0.04)
                ],
                Text(text,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold))
              ]));
  }
}
