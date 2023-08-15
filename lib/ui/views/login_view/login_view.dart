import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/main_view/main_view.dart';
import 'package:template/ui/views/register_view/register_view.dart';

import '../../shared/custom_widgets/custom_question.dart';
import '../../shared/custom_widgets/custom_tap_bar.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          extendBody: true,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,s
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTapBar(
                  title: "تسجيل الدخول",
                  imageName: "Login",
                  // iconName: "ic_back",
                ),
                const CustomText(text: "اسم المستخدم"),
                (width * 0.03).sbh,
                CustomTextField(
                  prefixIconName: 'ic_profile',
                  hinttext: "اسم المستخدم",
                  controller: controller.userController,
                ),
                (width * 0.05).sbh,
                const CustomText(text: "رمز الدخول"),
                (width * 0.03).sbh,
                CustomTextField(
                    prefixIconName: "ic_key",
                    hinttext: "رمز الدخول",
                    controller: controller.loginController),
                (width * 0.05).sbh,
                CustomButton(
                  text: "تسجيل الدخول",
                  textColor: AppColors.mainWhite,
                  onPressed:(){
                    Get.to(CustomQuestion(options: ['434','gchgc','gchgc'],questionText: 'wgat ig hbb',correctOptionIndex:0 ,));
                    // showCustomAlertDialog(context:context,isNotReport: false,report: controller.loginController);
                  },
                ),
                (width * 0.05).sbh,
                CustomRichText(
                    text1: 'ليس لديك حساب',
                    text2: 'أنشأ حسابك الان',
                    ontap: () {
                      Get.to(RegisterView());
                    }),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(const MainView());
                  },
                  child: const Center(
                      child: CustomText(
                    text: 'المتابعة كزائر',
                    isDecoration: true,
                  )),
                ),
                (width * 0.1).sbh,
              ],
            ),
          )),
    );
  }
}
