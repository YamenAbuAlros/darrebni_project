import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_container.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/it_view/it_view.dart';
import 'package:template/ui/views/it_view/main_it_controller.dart';

class MainItView extends StatefulWidget {
  const MainItView({super.key, required this.collageName});

  final String collageName;

  @override
  State<MainItView> createState() => _MainItViewState();
}

class _MainItViewState extends State<MainItView> {
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
                  CarouselSlider(
                    items: [
                      Image.asset('assets/images/ad-section.png'),

                      Image.asset('assets/images/ad-section.png'),

                      Image.asset('assets/images/ad-section.png'),
                      // CachedNetworkImage(
                      //   height: height * 0.1,
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      //   // width: width,

                      //   placeholder: (context, url) => CircularProgressIndicator(
                      //     color: AppColors.mainOrangeColor,
                      //     strokeWidth: 2,
                      //   ),
                      //   imageUrl: 'assets/images/ad-section.svg',
                      // ),
                    ],
                    options: CarouselOptions(
                      aspectRatio: 3,
                      // height: height * 0.4,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (i, _) {
                        controller.carouselIndex.value = i;
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  (height * 0.02).sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Obx(
                              () => Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: width * 0.01),
                                child: Container(
                                  width: width * 0.02,
                                  height: width * 0.02,
                                  decoration: BoxDecoration(
                                      color: controller.carouselIndex == index
                                          ? AppColors.mainPurple1
                                          : null,
                                      border: Border.all(width: width * 0.005)),
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
                  Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: width * 0.02,
                      runSpacing: width * 0.02,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        controller.nameOfSpecializations.length,
                        (index) {
                          final textLength =
                              controller.nameOfSpecializations[index].length;
                          final buttonWidth = (textLength * (width * 0.03)) +
                              width * 0.02; // تعديل القيمة حسب احتياجات
                          return Obx(() => CustomButton(
                              onPressed: () {
                                Get.to(ItView(
                                  collageName: controller.collageName,
                                  materialName:
                                  controller.nameOfSpecializations[index],
                                ));
                              },
                              // isBackgroundColor: false,
                              borderColor: AppColors.mainPurple1,
                              backgroundColor: AppColors.mainWhite,
                              widthSize: buttonWidth > width * 0.15
                                  ? buttonWidth
                                  : width * 0.19,
                              text: controller.nameOfSpecializations[index],
                              textColor: AppColors.mainPurple1));

                        },
                      )),
                  (width * 0.05).sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
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
