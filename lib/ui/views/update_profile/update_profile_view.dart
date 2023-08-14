import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/update_profile/update_profile_controller.dart';

import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/custom_widgets/custom_textfield.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  UpdateProfileController controller = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const CustomAppBar(
            iconName: 'ic_profile', text: 'تعديل المعلومات الشخصية'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "حلا الدروبي"),
              (width * 0.03).sbh,
              CustomTextField(
                textFieldColor: AppColors.mainblue3,
                suffixIconName: 'ic_edit',
                prefixIconName: 'ic_profile',
                hinttext: "حلا الدروبي",
                controller: controller.userController,
              ),
              (width * 0.05).sbh,
              const CustomText(text: "رقم الهاتف"),
              (width * 0.03).sbh,
              CustomTextField(
                  textFieldColor: AppColors.mainblue3,
                  suffixIconName: 'ic_edit',
                  prefixIconName: "ic_phone",
                  hinttext: "+963-999-999-999",
                  controller: controller.phoneNumberController),
              (width * 0.35).sbh,
              CustomButton(
                  text: 'حفظ التغيرات', textColor: AppColors.mainWhite),
              (width * 0.05).sbh,
              InkWell(
                onTap: () {
                  // Get.to();
                },
                child: const Center(
                    child: CustomText(
                  text: 'تراجع',
                  isDecoration: true,
                )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
