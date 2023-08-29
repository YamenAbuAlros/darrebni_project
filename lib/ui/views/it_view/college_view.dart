import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/courses_view/courses_view.dart';
import 'package:template/ui/views/it_question/it_question_view.dart';

import 'main_college_controller.dart';

class CollegeView extends StatefulWidget {
  const CollegeView(
      {super.key, required this.collageName, required this.materialName});

  final String collageName;
  final String materialName;

  @override
  State<CollegeView> createState() => _CollegeViewState();
}

class _CollegeViewState extends State<CollegeView> {
  late MainItController controller;

  // get itemBuilder => null;
  @override
  void initState() {
    controller = Get.put(MainItController(
        collageName: widget.collageName, materialName: widget.materialName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
            iconName: 'ic_back',
            ontap: () {
              Get.back();
            },
            text: '${controller.collageName}/${widget.materialName}'),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              (height * 0.08).sbh,
              CustomButton(
                text: 'دورات',
                textColor: AppColors.mainWhite,
                backgroundColor: AppColors.mainblue1,
                onPressed: () {
                  Get.to(CoursesView(
                    collageName: controller.collageName,
                    materialName: widget.materialName,
                  ));
                },
              ),
              (height * 0.08).sbh,
              CustomButton(
                text: 'أسئلة الكتاب',
                textColor: AppColors.mainWhite,
                onPressed: () {
                  Get.to(ItQuestionView(
                    collageName: controller.collageName,
                    materialName: widget.materialName,
                    typeOfQuestion: 'أسئلة الكتاب',
                  ));
                },
              )
            ],
          ),
        )
      ]),
    );
  }
}
