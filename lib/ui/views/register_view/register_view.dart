import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/login_view/login_view.dart';
import 'package:template/ui/views/register_view/register_controller.dart';

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
          extendBody: true,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
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
                    iconName: 'ic_profile',
                    hinttext: "اسم المستخدم",
                    controller: controller.userController),
                (width * 0.05).sbh,
                const CustomText(text: "رقم الموبايل"),
                (width * 0.03).sbh,
                CustomTextField(
                    iconName: 'ic_phone',
                    hinttext: "رقم الموبايل",
                    controller: controller.phoneController),
                (width * 0.05).sbh,
                const CustomText(text: "اختر الاختصاص"),
                (width * 0.05).sbh,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioLisTile(
                        text: controller.specializtionList[0],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[0],
                      ),
                      CustomRadioLisTile(
                        text: controller.specializtionList[1],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[1],
                      ),
                      CustomRadioLisTile(
                        text: controller.specializtionList[2],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[2],
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Row(
                    children: [
                      CustomRadioLisTile(
                        text: controller.specializtionList[3],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[3],
                      ),
                      CustomRadioLisTile(
                        text: controller.specializtionList[4],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[4],
                      ),
                      CustomRadioLisTile(
                        text: controller.specializtionList[5],
                        groupValue: controller.radioValue.value,
                        onchanged: (value) {
                          controller.radioValue.value = value!;
                        },
                        value: controller.specializtionList[5],
                      ),
                      //
                    ],
                  ),
                ),
                (width * 0.05).sbh,
                CustomButton(
                  text: "إنشاء الحساب",
                  textColor: AppColors.mainWhite,
                ),
                (width * 0.05).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'لديك حساب؟',
                      textcolor: AppColors.mainBlack,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const LoginView());
                      },
                      child: const CustomText(
                        text: 'تسجيل الدخول',
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

// Padding(
//                           padding = const EdgeInsetsDirectional.only(end: 1),
//                           child = RadioListTile(
//                               secondary: CustomText(
//                                 text: controller.specializtionList[index],
//                                 fontsize: width * 0.03,
//                               ),
//                               activeColor: AppColors.mainPurple1,
//                               // contentPadding: const EdgeInsetsDirectional.only(
//                               //   start: 12,
//                               // ),
//                               // title: Padding(
//                               //   padding:
//                               //       const EdgeInsetsDirectional.only(start: 0),
//                               //   child: CustomText(
//                               //     text: controller.specializtionList[index],
//                               //     fontsize: width * 0.03,
//                               //   ),
//                               // ),
//                               value: controller.specializtionList[index],
//                               onChanged: (value) {
//                                 controller.radioValue.value = value!;
//                               },
//                               groupValue: controller.radioValue.value),
//                         );

// Obx(
//   () => Column(
//     children: [
//       Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: RadioListTile(
//                 secondary:
//                     Text(controller.specializtionList[0]),
//                 activeColor: AppColors.mainPurple1,
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(start: 18),
//                 // title: CustomText(
//                 //   text: controller.specializtionList[0],
//                 //   fontsize: width * 0.03,
//                 // ),
//                 value: controller.specializtionList[0],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//           Expanded(
//             child: RadioListTile(
//                 secondary:
//                     Text(controller.specializtionList[1]),
//                 activeColor: AppColors.mainPurple1,
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(start: 18),
//                 // title: CustomText(
//                 //   text: controller.specializtionList[1],
//                 //   fontsize: width * 0.03,
//                 // ),
//                 value: controller.specializtionList[1],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//           Expanded(
//             child: RadioListTile(
//                 secondary:
//                     Text(controller.specializtionList[2]),
//                 activeColor: AppColors.mainPurple1,
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(start: 18),
//                 // title: CustomText(
//                 //   text: controller.specializtionList[2],
//                 //   fontsize: width * 0.03,
//                 // ),
//                 value: controller.specializtionList[2],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//         ],
//       ),
//       Row(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 4,
//             child: RadioListTile(
//                 secondary:
//                     Text(controller.specializtionList[3]),
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(
//                         start: 0, end: 0),
//                 // title: CustomText(
//                 //   text: controller.specializtionList[3],
//                 //   fontsize: width * 0.03,
//                 // ),
//                 activeColor: AppColors.mainPurple1,
//                 value: controller.specializtionList[3],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//           Expanded(
//             flex: 4,
//             child: RadioListTile(
//                 secondary: Text(
//                   controller.specializtionList[4],
//                 ),
//                 activeColor: AppColors.mainPurple1,
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(start: 8),
//                 // title: CustomText(
//                 //   text: controller.specializtionList[4],
//                 //   fontsize: width * 0.03,
//                 // ),
//                 value: controller.specializtionList[4],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//           Expanded(
//             flex: 3,
//             child: RadioListTile(
//                 secondary:
//                     Text(controller.specializtionList[5]),
//                 activeColor: AppColors.mainPurple1,
//                 contentPadding:
//                     const EdgeInsetsDirectional.only(start: 16),
//                 // title: CustomText(
//                 //     fontsize: width * 0.03,
//                 //     text: controller.specializtionList[5]),
//                 value: controller.specializtionList[5],
//                 onChanged: (value) {
//                   controller.radioValue.value = value!;
//                 },
//                 groupValue: controller.radioValue.value),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),

// SizedBox(
// height: height * 0.13,
// child: GridView.count(
//     crossAxisSpacing: 2,
//     crossAxisCount: 3,
//     shrinkWrap: true,
//     childAspectRatio: 3,
//     // padding: EdgeInsetsDirectional.only(end: width * 0.04),
//     // crossAxisSpacing: width * 0.01,
//     // mainAxisSpacing: width * 0.04,
//     physics: const NeverScrollableScrollPhysics(),
//     children: List.generate(
//         controller.specializtionList.length, (index) {
//       return Expanded(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Radio(
//               value: controller.specializtionList[index],
//               groupValue: controller.radioValue.value,
//               onChanged: (value) {
//                 controller.radioValue.value = value!;
//               },
//             ),
//             CustomText(
//               text: controller.specializtionList[index],
//               fontsize: width * 0.03,
// )
// ],
// ),
// );
// })),
// ),

// Radio(
//   value: controller.specializtionList[3],
//   activeColor: AppColors.mainPurple1,
//   groupValue: controller.radioValue.value,
//   onChanged: (value) {
//     controller.radioValue.value = value!;
//     print(value);
//   },
// ),
// CustomText(
//   text: controller.specializtionList[3],
//   fontsize: width * 0.022,
// ),
// Radio(
//   value: controller.specializtionList[4],
//   groupValue: controller.radioValue.value,
//   activeColor: AppColors.mainPurple1,
//   onChanged: (value) {
//     controller.radioValue.value = value!;
//     print(value);
//   },
// ),
// CustomText(
//   text: controller.specializtionList[4],
//   fontsize: width * 0.022,
// ),
// Radio(
//   value: controller.specializtionList[5],
//   groupValue: controller.radioValue.value,
//   activeColor: AppColors.mainPurple1,
//   onChanged: (value) {
//     controller.radioValue.value = value!;
//     print(value);
//   },
// ),
// CustomText(
//     text: controller.specializtionList[5],
//     fontsize: width * 0.022),
