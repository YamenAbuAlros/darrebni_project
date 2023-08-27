import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
import 'package:template/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/login_view/login_view.dart';
import 'package:template/ui/views/register_view/register_controller.dart';
import '../../../core/utilis/string_util.dart';
import '../../shared/custom_widgets/custom_tap_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTapBar(
                      title: "إنشاء حساب",
                      imageName: "signup",
                      iconName: "ic_back",
                    ),
                    const CustomText(text: "اسم المستخدم"),
                    (width * 0.03).sbh,
                    CustomTextField(
                        keyboardtype: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) return 'الرجاء إدخال اسمك';

                          if (!StringUtil.isArabicOrEnglishName(value)) {
                            return 'الرجاء التحقق من اسمك';
                          }
                          return null;
                        },
                        prefixIconName: 'ic_profile',
                        hinttext: "اسم المستخدم",
                        controller: controller.userController),
                    (width * 0.03).sbh,
                    const CustomText(text: "رقم الموبايل"),
                    (width * 0.03).sbh,
                    CustomTextField(
                        keyboardtype: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال رقم الموبايل';
                          }
                          if (!StringUtil.isValidSyriaMobileNumber(value)) {
                            return 'الرجاء التحقق من الرقم';
                          }
                          return null;
                        },
                        prefixIconName: 'ic_phone',
                        hinttext: "رقم الموبايل",
                        controller: controller.phoneController),
                    (width * 0.03).sbh,
                    const CustomText(text: "اختر الاختصاص"),
                    (width * 0.03).sbh,
                    Obx(() => controller.isLoading.value
                        ? SpinKitWave(
                            color: AppColors.mainPurple1,
                            size: width * 0.09,
                          )
                        : Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: width * 0.01,
                            children: List.generate(
                              controller.specializationList.length,
                              (index) {
                                return Column(
                                  children: [
                                    CachedNetworkImage(
                                      height: height * 0.04,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(
                                        color: AppColors.mainPurple1,
                                        strokeWidth: 2,
                                      ),
                                      imageUrl: 'https://backendsp01.000webhostapp.com/public/images/college/1692752664.jpg',
                                      // controller.specializationList[index][1],
                                    ),
                                    CustomRadioLisTile(
                                      text: controller
                                          .specializationList[index][0],
                                      groupValue: controller.collegeId.value,
                                      onchanged: (value) {
                                        controller.collegeId.value = value!;
                                      },
                                      value: controller
                                          .specializationList[index][2],
                                    ),
                                  ],
                                );
                              },
                            ),
                          )),
                    (width * 0.05).sbh,

                    CustomButton(
                      onPressed: () {
                        controller.register();
                      },
                      text: "إنشاء الحساب",
                      textColor: AppColors.mainWhite,
                    ),
                    (width * 0.05).sbh,
                    CustomRichText(
                        text1: 'لديك حساب؟',
                        text2: 'تسجيل الدخول',
                        ontap: () {
                          Get.off(() => const LoginView());
                        }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
