import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/views/it_question/it_question_controller.dart';

import '../../shared/colors.dart';
class ItQuestionView extends StatefulWidget {
  const ItQuestionView({super.key,required this.collageName, required this.materialName,required this.typeOfQuestion});
  final String collageName;
  final String materialName;
  final String typeOfQuestion;
  @override
  State<ItQuestionView> createState() => _ItQuestionViewState();
}

class _ItQuestionViewState extends State<ItQuestionView> {
  late ItQuestionController controller;

  // get itemBuilder => null;
  @override
  void initState() {
    controller = Get.put(ItQuestionController(
        collageName: widget.collageName, materialName: widget.materialName,typeOfQuestion:widget.typeOfQuestion));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBar(
          iconName: 'ic_back',
          text: '${controller.collageName}/${widget.materialName}/${widget.typeOfQuestion}'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LinearProgressIndicator(
          minHeight: 10,
          color: Colors.lightBlue, // لون الشريط عندما يكون مكتمل
          backgroundColor: AppColors.mainPurple1, // لون الشريط عندما لم يتم تحقيق النسبة المئوية بعد
        ),
      ),
    ]);
  }
}
