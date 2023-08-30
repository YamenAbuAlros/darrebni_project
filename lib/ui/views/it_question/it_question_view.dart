import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/it_question/it_question_controller.dart';
import 'package:template/ui/views/result_view/result_view.dart';

import '../../shared/colors.dart';

class ItQuestionView extends StatefulWidget {
  const ItQuestionView(
      {super.key,
      required this.collageName,
      required this.materialName,
      required this.typeOfQuestion});
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
        collageName: widget.collageName,
        materialName: widget.materialName,
        typeOfQuestion: widget.typeOfQuestion));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
            iconName: 'ic_back',
            text:
                '${controller.collageName}/${widget.materialName}/${widget.typeOfQuestion}'),
        Obx(() => controller.isLoading.value
            ? Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                            '${controller.allQuestionsList.length}/${controller.indexOfQuestions.value + 1}'),

                    LinearProgressIndicator(
                      value: (controller.indexOfQuestions.value + 1) /
                          controller.allQuestionsList.length,
                      minHeight: 10,
                      color: Colors.lightBlue, // لون الشريط عندما يكون مكتمل
                      backgroundColor: AppColors
                          .mainPurple1, // لون الشريط عندما لم يتم تحقيق النسبة المئوية بعد
                    ),

                    (height * 0.02).sbh,
                    controller.allQuestionsList.isNotEmpty
                        ? CustomText(
                            text:
                                "${controller.indexOfQuestions.value + 1}.${controller.allQuestionsList[controller.indexOfQuestions.value].content!}")
                        : SpinKitWave(
                            color: AppColors.mainPurple1,
                          ),

                    (height * 0.02).sbh,
                    controller.allQuestionsList.isNotEmpty
                        ? Column(
                            children: List.generate(
                                controller
                                    .allQuestionsList[
                                        controller.indexOfQuestions.value]
                                    .answers!
                                    .length, (index) {
                              return Container(
                                constraints: BoxConstraints(
                                    minHeight: width * 0.07,
                                    minWidth: width * 0.9),
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.02),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: width * 0.03),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: controller.isCorrect.value &&
                                              controller.allQuestionsList[controller.indexOfQuestions.value].answers![index].uuid ==
                                                  controller.groupvalue[controller
                                                      .indexOfQuestions.value]  
                                          ? (controller
                                                      .allQuestionsList[
                                                          controller
                                                              .indexOfQuestions
                                                              .value]
                                                      .answers![index]
                                                      .isTrue! &&
                                                  controller
                                                          .allQuestionsList[controller.indexOfQuestions.value]
                                                          .answers![index]
                                                          .uuid ==
                                                      controller.groupvalue[controller.indexOfQuestions.value]
                                              ? AppColors.mainblue1
                                              : AppColors.redColor)
                                          : AppColors.mainPurple1,
                                      width: width * 0.005),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  children: [
                                    CustomRadioLisTile(textColor: controller.isCorrect.value &&
                                                  controller.allQuestionsList[controller.indexOfQuestions.value].answers![index].uuid ==
                                                      controller.groupvalue[controller
                                                          .indexOfQuestions.value]
                                              ? (controller
                                                          .allQuestionsList[
                                                              controller
                                                                  .indexOfQuestions
                                                                  .value]
                                                          .answers![index]
                                                          .isTrue! &&
                                                      controller
                                                              .allQuestionsList[controller.indexOfQuestions.value]
                                                              .answers![index]
                                                              .uuid ==
                                                          controller.groupvalue[controller.indexOfQuestions.value]
                                                  ? AppColors.mainblue1
                                                  : AppColors.redColor)
                                              : AppColors.mainPurple1,
                                        value: controller
                                            .allQuestionsList[
                                                controller.indexOfQuestions.value]
                                            .answers![index]
                                            .uuid!,
                                        groupValue: controller.groupvalue[
                                            controller.indexOfQuestions.value],
                                        onchanged: !controller.isCorrect.value &&
                                                !controller.chooseQuestions[
                                                    controller
                                                        .indexOfQuestions.value]
                                            ? (value) {
                                                controller.groupvalue[controller
                                                    .indexOfQuestions
                                                    .value] = value;
                                              }
                                            : null,
                                        text: controller
                                            .allQuestionsList[
                                                controller.indexOfQuestions.value]
                                            .answers![index]
                                            .content!),
                                            if(controller
                                                          .allQuestionsList[
                                                              controller
                                                                  .indexOfQuestions
                                                                  .value]
                                                          .answers![index]
                                                          .isTrue! &&
                                                      controller
                                                              .allQuestionsList[controller.indexOfQuestions.value]
                                                              .answers![index]
                                                              .uuid ==
                                                          controller.groupvalue[controller.indexOfQuestions.value])SvgPicture.asset('assets/images/correct.svg'),
                                  ],
                                ),
                              );
                            }),
                          )
                        : SpinKitWave(
                            color: AppColors.mainPurple1,
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.groupvalue[
                                    controller.indexOfQuestions.value] !=
                                '') {
                              controller.isCorrect.value = true;
                            } else {
                              Get.showSnackbar(const GetSnackBar(
                                title: 'ليك لقلك',
                                message: 'الرجاء اختيار الأجابة',
                                duration: Duration(seconds: 2),
                              ));
                            }
                          },
                          child: SvgPicture.asset('assets/images/true.svg',
                              width: width * 0.05),
                        ),
                        (width * 0.03).sbw,
                        SvgPicture.asset('assets/images/ic_reference.svg',
                            width: width * 0.05),
                        (width * 0.03).sbw,
                        SvgPicture.asset('assets/images/ic_star.svg',
                            width: width * 0.05),
                        // SvgPicture.asset('assets/images/ic_star_selected.svg',width: width*0.05),
                      ],
                    ),

                    // (height * 0.03).sbh
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsetsDirectional.only(top: height * 0.35),
                child: SpinKitWave(
                  color: AppColors.mainPurple1,
                ),
              )),
        const Spacer(),
  Obx(() =>    Visibility(
      visible: controller.allQuestionsList.length>0,
      child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: controller.indexOfQuestions.value > 0
                        ? () {
                            controller.indexOfQuestions.value -= 1;
                            controller.isCorrect.value = false;
                          }
                        : null,
                    text: 'السابق',
                    textColor: AppColors.blueColor,
                    widthSize: width * 0.25,
                    backgroundColor: AppColors.mainWhite,
                    borderColor: AppColors.blueColor,
                  ),
                  CustomButton(
                      onPressed: controller.indexOfQuestions.value <
                                  controller.allQuestionsList.length - 1 &&
                              controller.groupvalue[
                                      controller.indexOfQuestions.value] !=
                                  ''
                          ? () {
                              controller.chooseQuestions[
                                  controller.indexOfQuestions.value] = true;

                              controller.indexOfQuestions += 1;
                              controller.isCorrect.value = false;
                              controller.answers.add({
                                "question_uuid": controller
                                    .allQuestionsList[
                                        controller.indexOfQuestions.value]
                                    .uuid!,
                                "answer_uuid": controller.groupvalue[
                                    controller.indexOfQuestions.value]
                              });
                            }
                          : controller.indexOfQuestions.value <
                                  controller.allQuestionsList.length - 1
                              ? () {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'ليك لقلك',
                                    message: 'الرجاء اختيار الأجابة',
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              : () {
                                  Get.to(() => const ResultView());
                                },
                      text: 'التالي',
                      textColor: AppColors.mainWhite,
                      widthSize: width * 0.25),
                ],
              ),
            )),),
        (height * 0.02).sbh,
      ]),
    );
  }
}
