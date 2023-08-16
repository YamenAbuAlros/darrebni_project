import 'dart:io';

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
import 'package:template/ui/views/main_view/profile_view/profile_controller.dart';
import 'package:template/ui/views/update_profile/update_profile_view.dart';

import '../../../shared/custom_widgets/custom_container.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(
          iconName: 'ic_profile',
          text: "الملف الشخصي",
          ontap: () {
            Get.back();
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (controller) {
                  return InkWell(
                    onTap: () {
                      controller.showBottomSheetwithGetX();
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.mainWhite,
                      child: controller.choosedImage != null
                          ? ClipOval(
                              child: controller.choosedImage != null
                                  ? Image.file(
                                      File(controller.choosedImage!.path),
                                      fit: BoxFit.fill,
                                    )
                                  : controller.result != null
                                      ? const Icon(Icons.file_copy)
                                      : null,
                            )
                          : SvgPicture.asset('assets/images/User.svg'),
                    ),
                  );
                },
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




// GetBuilder<SignUpContoller>(
//                 init: SignUpContoller(),
//                 builder: (controller) => Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: InkWell(
//                         onTap: controller.choosedImage == null &&
//                                 controller.result == null
//                             ? () {
//                                 signUpController.showBottomSheetwithGetX();
                //               }
                //             : null,
                //         child: CircleAvatar(
                //           radius: width * 0.13,
                //           backgroundColor: AppColors.placeHolderColor,
                //           child: ClipOval(
                //             child: controller.choosedImage != null
                //                 ? Image.file(
                //                     File(controller.choosedImage!.path),
                //                     fit: BoxFit.fill,
                //                   )
                //                 : controller.result != null
                //                     ? const Icon(Icons.file_copy)
                //                     : null,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Visibility(
                //       visible: controller.choosedImage != null ||
                //           controller.result != null,
                //       child: Positioned(
                //           left: width * 0.55,
                //           child: InkWell(
                //             onTap: () {
                //               signUpController.showBottomSheetwithGetX();
                //             },
                //             child: CircleAvatar(
                //               radius: width * 0.05,
                //               child: const Icon(Icons.edit),
                //             ),
                //           )),
                //     )
                //   ],
                // ),
              // ),