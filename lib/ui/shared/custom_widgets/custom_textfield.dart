import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hinttext,
    this.mheight,
    this.mwidth,
    this.fontsize,
    this.bradius,
    required this.controller,
    this.errorText,
    this.validator,
    this.label,
    this.prefixIconName,
    this.suffixIconName,
    this.textFieldColor,
  });
  final String? Function(String?)? validator;
  final String? hinttext;
  final double? mheight;
  final double? mwidth;
  final double? fontsize;
  final TextEditingController controller;
  final double? bradius;
  final String? errorText;
  final String? label;
  final String? prefixIconName;
  final String? suffixIconName;
  final Color? textFieldColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: controller,

      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          maxWidth: width * 0.05,
        ),
        suffixIcon: suffixIconName != null
            ? SvgPicture.asset(
                "assets/images/$suffixIconName.svg",
                color: AppColors.placeHolderColor,
              )
            : null,
        prefix: SizedBox(
          width: width * 0.02,
        ),
        prefixIcon:prefixIconName != null? SvgPicture.asset(
          "assets/images/$prefixIconName.svg",
          color: AppColors.placeHolderColor,
        ):null,
        prefixIconConstraints: BoxConstraints(
          maxWidth: width * 0.05,
        ),
        contentPadding: const EdgeInsetsDirectional.only(start: 10),
        filled: true,
        fillColor: textFieldColor ?? AppColors.mainblue2,
        constraints: BoxConstraints(
            minWidth: mwidth ?? width, minHeight: mheight ?? width * 0.15),
        prefixIconColor: AppColors.placeHolderColor,
        hintText: hinttext,
        hintStyle: TextStyle(
            color: AppColors.placeHolderColor,
            fontSize: fontsize ?? width * 0.035),
        enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(bradius ?? width * 0.02),
            borderSide: BorderSide(color: AppColors.mainWhiteColor)),
      ),
    );
  }
}
