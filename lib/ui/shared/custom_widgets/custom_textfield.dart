import 'package:flutter/material.dart';
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
    required this.prefixIcon,
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
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          maxWidth: width * 0.05,
        ), // hintTextDirection: TextDirection.ltr,
        filled: true,
        fillColor: AppColors.mainblue2,
        constraints: BoxConstraints(
            maxWidth: mwidth ?? width, maxHeight: mheight ?? width * 0.14),

        hintText: hinttext,
        hintStyle: TextStyle(
            color: AppColors.mainblue1, fontSize: fontsize ?? width * 0.035),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bradius ?? width * 0.02),
            borderSide: BorderSide(color: AppColors.mainWhiteColor)),
      ),
    );
  }
}
