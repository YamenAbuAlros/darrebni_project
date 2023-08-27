import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';

import '../../../shared/utils.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(iconName: 'ic_back', text: 'الإشعارات'),
        (width*0.14).sbh,
        SvgPicture.asset('assets/images/notification.svg'),
        (width*0.07).sbh,
        CustomText(
            text: 'الإشعارات', fontsize: width*0.07, textcolor: AppColors.maingrey),
        (width*0.08).sbh,
        CustomText(
          text:
          'أبقى على إطلاع بمواعيد الإمتحان الوطني\n صدور النتائج، إضافة أسئلة، والكثير من\n الأخبار',
          fontsize: width*0.04,
          textcolor: AppColors.maingrey,
          isTextAlignCenter: true,
        ),
        (width*0.09).sbh,
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.12),
          child: CustomButton(text: 'تفعيل الإشعارات', textColor: AppColors.mainWhite),
        ),
        (width*0.03).sbh,
        CustomText(
          text:'تجاهل',
          isDecoration:true,
          fontsize: width*0.04,
          textcolor: AppColors.maingrey,
        ),
      ],
    );
  }
}
