// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_container.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/it_question/it_question_view.dart';
import 'package:template/ui/views/it_view/college_view.dart';
import 'package:template/ui/views/it_view/main_college_controller.dart';

class MainCollegeView extends StatefulWidget {
  const MainCollegeView({super.key, required this.collageName});

  final String collageName;

  @override
  State<MainCollegeView> createState() => _MainCollegeViewState();
}

class _MainCollegeViewState extends State<MainCollegeView> {
  late MainItController controller;

  // get itemBuilder => null;
  @override
  void initState() {
    controller = Get.put(MainItController(collageName: widget.collageName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        CustomAppBar(
            iconName: 'ic_back',
            text: controller.collageName,
            ontap: () {
              Get.back();
            }),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                end: width * 0.05, start: width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                      controller: controller.searchController,
                      prefixIconName: 'ic_search',
                      hinttext: 'بحث'),
                  Obx(
                    () => controller.allSliderList.isEmpty
                        ? SpinKitWave(
                            color: AppColors.mainPurple1,
                          )
                        : CarouselSlider(
                            items: List.generate(
                                controller.allSliderList.length, (index) {
                              return CachedNetworkImage(
                                height: height * 0.1,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                // width: width,

                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                  color: AppColors.mainPurple1,
                                  strokeWidth: 2,
                                ),
                                imageUrl: controller
                                    .allSliderList[index].imageUrl
                                    .toString(),
                              );
                            }),
                            options: CarouselOptions(
                              aspectRatio: 3,
                              // height: height * 0.4,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              onPageChanged: (i, _) {
                                controller.indexCarousel.value = i;
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                  ),
                  (height * 0.03).sbh,
                  Obx(
                    () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.allSliderList.length,
                          (index) => Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: width * 0.01),
                            child: Container(
                              width: width * 0.02,
                              height: width * 0.02,
                              decoration: BoxDecoration(
                                  color: controller.indexCarousel == index
                                      ? AppColors.mainPurple1
                                      : null,
                                  border: Border.all(width: width * 0.001)),
                            ),
                          ),
                        )),
                  ),
                  (height * 0.04).sbh,
                  CustomContainer(
                    text: 'التصنيفات',
                    color: AppColors.mainBlack,
                  ),
                  (width * 0.05).sbh,
                  Obx(() => controller.nameOfSpecializations.isNotEmpty
                      ? Wrap(
                          // crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: width * 0.02,
                          runSpacing: width * 0.02,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            controller.nameOfSpecializations.length,
                            (index) {
                              final textLength = controller
                                  .nameOfSpecializations[index].name!.length;
                              final buttonWidth =
                                  (textLength * (width * 0.03)) +
                                      width * 0.02;
                              return CustomButton(
                                  onPressed: () {
                                    Get.to(() => CollegeView(
                                          collageName: controller.collageName,
                                          materialName: controller
                                              .nameOfSpecializations[index]
                                              .name!,
                                        ));
                                  },
                                  borderColor: AppColors.mainPurple1,
                                  backgroundColor: AppColors.mainWhite,
                                  widthSize: buttonWidth > width * 0.15
                                      ? buttonWidth
                                      : width * 0.19,
                                  text: controller
                                      .nameOfSpecializations[index].name!,
                                  textColor: AppColors.mainPurple1);
                            },
                          ))
                      : SpinKitWave(
                          color: AppColors.mainPurple1,
                        )),
                  (width * 0.05).sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          onPressed: () {
                            Get.to(() => ItQuestionView(
                                collageName: controller.collageName,
                                materialName: controller.materialName,
                                typeOfQuestion: ''));
                          },
                          backgroundColor: AppColors.mainblue1,
                          widthSize: width * 0.3,
                          text: 'الدورات',
                          textColor: AppColors.mainWhite),
                      (width * 0.05).sbw,
                      CustomButton(
                          widthSize: width * 0.3,
                          text: 'بنك الأسئلة',
                          textColor: AppColors.mainWhite)
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
