import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/utilis/string_util.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/main_view/main_view.dart';
import 'package:template/ui/views/register_view/register_view.dart';
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
          // extendBody: true,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
            child: Form(
              key: controller.formKey,
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
                    keyboardtype: TextInputType.text,
                    prefixIconName: 'ic_profile',
                    hinttext: "اسم المستخدم",
                    controller: controller.userNameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'الرجاء إدخال اسمك';

                      if (!StringUtil.isArabicOrEnglishName(value)) {
                        return 'الرجاءالتحقق من اسمك';
                      }
                      return null;
                    },
                  ),
                  (width * 0.05).sbh,
                  const CustomText(text: "رمز الدخول"),
                  (width * 0.03).sbh,
                  CustomTextField(
                      keyboardtype: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'الرجاء إدخال رمز الدخول';
                        return null;
                      },
                      prefixIconName: "ic_key",
                      hinttext: "رمز الدخول",
                      controller: controller.codeLoginController),
                  (width * 0.05).sbh,
                  CustomButton(
                    onPressed: () {
                      controller.login();
                    },
                    text: "تسجيل الدخول",
                    textColor: AppColors.mainWhite,
                  ),
                  (width * 0.05).sbh,
                  CustomRichText(
                      text1: 'ليس لديك حساب؟',
                      text2: 'أنشأ حسابك الان',
                      ontap: () {
                        Get.to(const RegisterView());
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
            ),
          )),
    );
  }
}
