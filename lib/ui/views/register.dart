import 'package:flutter/material.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: "اسم المستخدم"),
            CustomTextField(
                prefixIcon: const Icon(Icons.person),
                hinttext: "اسم المستخدم",
                controller: textController),
            (width * 0.05).sbh,
            const CustomText(text: "رقم الموبايل"),
            CustomTextField(
                prefixIcon: const Icon(Icons.person),
                hinttext: "رقم الموبايل",
                controller: textController),
            (width * 0.05).sbh,
            const CustomText(text: "اختر الاختصاص"),
            (width * 0.05).sbh,
            CustomButton(
              text: "انشاء الحساب",
              textColor: AppColors.mainWhite,
            )
          ],
        ),
      )),
    );
  }
}
