import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/main_view/main_view.dart';
import 'package:template/ui/views/register_view/register_view.dart';

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
          extendBody: true,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,s
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  title: "تسجيل الدخول",
                  imageName: "Login",
                  // iconName: "ic_back",
                ),
                const CustomText(text: "اسم المستخدم"),
                (width * 0.03).sbh,
                CustomTextField(
                  iconName: 'ic_profile',
                  hinttext: "اسم المستخدم",
                  controller: controller.userController,
                ),
                (width * 0.05).sbh,
                const CustomText(text: "رمز الدخول"),
                (width * 0.03).sbh,
                CustomTextField(
                    iconName: "ic_key",
                    hinttext: "رمز الدخول",
                    controller: controller.loginController),
                (width * 0.05).sbh,
                CustomButton(
                  text: "تسجيل الدخول",
                  textColor: AppColors.mainWhite,
                ),
                (width * 0.05).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'ليس لديك حساب؟',
                      textcolor: AppColors.mainBlack,
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(const RegisterView());
                      },
                      child: const CustomText(
                        text: 'أنشأ حسابك الآن',
                      ),
                    ),
                  ],
                ),
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
