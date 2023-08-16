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
import 'package:template/ui/views/it_view/main_it_controller.dart';

class MainItView extends StatefulWidget {
  const MainItView({super.key});

  @override
  State<MainItView> createState() => _MainItViewState();
}

class _MainItViewState extends State<MainItView> {
  MainItController controller = Get.put(MainItController());

  get itemBuilder => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
            iconName: 'ic_back',
            text: 'كلية الهندسة المعلوماتية',
            ontap: () {
              Get.back();
            }),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              CustomTextField(
                  controller: controller.searchController,
                  prefixIconName: 'ic_search',
                  hinttext: 'بحث'),
              CarouselSlider(
                items: [
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
                options: CarouselOptions(aspectRatio: 3),
              ),
              (height * 0.02).sbh,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: width * 0.02,
                  height: width * 0.02,
                  decoration:
                      BoxDecoration(border: Border.all(width: width * 0.005)),
                ),
                (width * 0.01).sbw,
                Container(
                  width: width * 0.02,
                  height: width * 0.02,
                  decoration:
                      BoxDecoration(border: Border.all(width: width * 0.005)),
                ),
                (width * 0.01).sbw,
                Container(
                  width: width * 0.02,
                  height: width * 0.02,
                  decoration:
                      BoxDecoration(border: Border.all(width: width * 0.005)),
                )
              ]),
              (height * 0.04).sbh,
              CustomContainer(
                text: 'التصنيفات',
                color: AppColors.mainBlack,
              ),
              Wrap(
                  children: List.generate(
                controller.nameList.length,
                (index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: width * 0.02, bottom: width * 0.02),
                    child: CustomButton(
                        isBackgroundColor: false,
                        borderColor: AppColors.mainPurple1,
                        backgroundColor: AppColors.mainWhite,
                        widthSize: width * 0.4,
                        text: controller.nameList[index],
                        textColor: AppColors.blueColor),
                  );
                },
              )),
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
              )
            ],
          ),
        )
      ]),
    );
  }
}
