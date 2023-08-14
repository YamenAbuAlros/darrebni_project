import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';

class CustomOveralayRegister extends StatelessWidget {
  const CustomOveralayRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset('assets/images/ic_key'),
          CustomText(text: 'يرجى الاشتراك لإتمام عملية التصفح'),
          CustomButton(text: 'تسجيل الدخول', textColor: AppColors.mainPurple1),
        ],
      ),
    );
  }
}
