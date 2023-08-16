import 'package:flutter/material.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

class ItView extends StatefulWidget {
  const ItView({super.key});

  @override
  State<ItView> createState() => _ItViewState();
}

class _ItViewState extends State<ItView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const CustomAppBar(
            iconName: 'ic_back', text: 'كلية الهندسة المعلوماتية/الشبكات'),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              (height * 0.08).sbh,
              CustomButton(
                  text: 'دورات',
                  textColor: AppColors.mainWhite,
                  backgroundColor: AppColors.mainblue1),
              (height * 0.08).sbh,
              CustomButton(text: 'أسئلة الكتاب', textColor: AppColors.mainWhite)
            ],
          ),
        )
      ]),
    );
  }
}
