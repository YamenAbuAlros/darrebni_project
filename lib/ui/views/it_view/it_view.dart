import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/it_question/it_question_view.dart';

import 'main_it_controller.dart';

class ItView extends StatefulWidget {
  const ItView(
      {super.key, required this.collageName, required this.materialName});

  final String collageName;
  final String materialName;

  @override
  State<ItView> createState() => _ItViewState();
}

class _ItViewState extends State<ItView> {
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
                  Get.to(ItQuestionView(
                    collageName: controller.collageName,
                    materialName: widget.materialName,
                    typeOfQuestion: 'دورات',
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
