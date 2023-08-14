import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';

import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/about_app/about_app.dart';
import 'package:template/ui/views/update_profile/update_profile_view.dart';

import '../../../shared/custom_widgets/custom_container.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const CustomAppBar(iconName: 'ic_profile', text: "الملف الشخصي"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.mainWhite,
                child: SvgPicture.asset('assets/images/User.svg'),
              ),
              (height * 0.02).sbh,
              const CustomText(text: 'اسم المستخدم'),
              (height * 0.06).sbh,
              CustomContainer(
                ontap: () {
                  Get.to(const UpdateProfileView());
                },
                text: 'المعلومات الشخصية',
                iconName: 'ic_edit',
              ),
              (height * 0.04).sbh,
              CustomContainer(
                ontap: () {},
                color: AppColors.mainblue1,
                text: 'ارسال شكاوي',
                iconName: 'ic_send',
              ),
              (height * 0.04).sbh,
              CustomContainer(
                ontap: () {
                  Get.to(const AboutAppView());
                },
                color: AppColors.mainBlack,
                text: 'عن التطبيق',
                iconName: 'ic_info',
              ),
              (height * 0.04).sbh,
              CustomButton(text: 'تسجيل الخروج', textColor: AppColors.mainWhite)
            ],
          ),
        )
      ],
    ));
  }
}
