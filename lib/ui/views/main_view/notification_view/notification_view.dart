import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';

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
        (80).sbh,
        SvgPicture.asset('assets/images/notification.svg'),
        (30).sbh,
        CustomText(
            text: 'الإشعارات', fontsize: 28, textcolor: AppColors.maingrey),
        (20).sbh,
        CustomText(
          text:
          'أبقى على إطلاع بمواعيد الإمتحان الوطني\n صدور النتائج، إضافة أسئلة، والكثير من\n الأخبار',
          fontsize: 14,
          textcolor: AppColors.maingrey,
          isTextAlignCenter: true,
        ),
        (40).sbh,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButton(text: 'تفعيل الإشعارات', textColor: AppColors.mainWhite),
        ),
        (10).sbh,
        CustomText(
          text:'تجاهل',
          isDecoration:true,
          fontsize: 8,
          textcolor: AppColors.maingrey,
        ),
      ],
    );
  }
}
