import 'package:flutter/material.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hinttext,
    required this.mheight,
    required this.mwidth,
    this.fontsize,
    this.bradius,
    required this.controller,
    this.errorText,
    this.validator,
    this.label,
  });
  final String? Function(String?)? validator;
  final String? hinttext;
  final double mheight;
  final double mwidth;
  final double? fontsize;
  final TextEditingController controller;
  final double? bradius;
  final String? errorText;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: label ?? '',
        filled: true,
        fillColor: AppColors.textFormFieldColor,
        constraints: BoxConstraints(maxWidth: mwidth, maxHeight: mheight),
        contentPadding: EdgeInsetsDirectional.only(start: width * 0.09),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: AppColors.placeHolderColor,
            fontSize: fontsize ?? width * 0.04),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bradius ?? width * 0.09),
            borderSide: BorderSide(color: AppColors.mainWhiteColor)),
      ),
    );
  }
}
