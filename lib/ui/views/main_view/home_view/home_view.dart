import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/core/utilis/general_util.dart';
import 'package:template/ui/shared/custom_widgets/custom_overalay.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/views/it_view/main_it_view.dart';

import 'package:template/ui/views/main_view/home_view/home_controller.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_app_bar.dart';
import '../../../shared/custom_widgets/custom_container.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(iconName: 'ic_home', text: 'الرئيسية'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                    controller: controller.searchController,
                    prefixIconName: 'ic_search',
                    hinttext: 'بحث'),
                // (height * 0.005).sbh,
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
                                      color: controller.indexCarousel == index
                                          ? AppColors.mainPurple1
                                          : null,
                                      border: Border.all(width: width * 0.005)),
                                ),
                              ),
                            ))),

                CustomContainer(text: 'التصنيفات', color: AppColors.maingrey),

                (height * 0.03).sbh,
                SizedBox(
                    height: height * 0.05,
                    child: Obx(() => controller.categoriesAllName.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => Container(
                                    decoration: controller.selectedNum.value ==
                                            index
                                        ? BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: width * 0.005,
                                                    color:
                                                        AppColors.mainblue1)))
                                        : null,
                                    child: InkWell(
                                      onTap: () {
                                        controller.changeList(index);
                                      },
                                      child: CustomText(
                                        text:
                                            controller.categoriesAllName[index],
                                        textcolor:
                                            controller.selectedNum.value ==
                                                    index
                                                ? AppColors.mainblue1
                                                : AppColors.mainBlack,
                                      ),
                                    ),
                                  ));
                            },
                            itemCount: controller.categoriesAllName.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0.05,
                              );
                            },
                          )
                        : Center(
                            child: SpinKitWave(
                              color: AppColors.mainPurple1,
                              size: width * 0.09,
                            ),
                          ))),
                (height * 0.025).sbh,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        controller.gridLength.value > 4
                            ? controller.gridLength.value - 2
                            : controller.gridLength.value, (index) {
                      var imageName =
                          controller.specializzationListShow[index].last;

                      return InkWell(
                        onTap: () {storage.isLoggedIn?
                          Get.to(MainItView(
                            collageName:
                                controller.specializzationListShow[index].first,
                          )):showCustomAlertDialog();
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/ic_search.svg',
                            ),
                            (height * 0.02).sbh,
                            CustomText(
                                text: controller
                                    .specializzationListShow[index].first)
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                (height * 0.025).sbh,
                Obx(() {
                  return controller.gridLength.value == 6
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(2, (index) {
                            var imageName = controller
                                .specializzationListShow[index + 4].last;
                            return InkWell(
                              onTap: () {
                                Get.to(MainItView(
                                  collageName: controller
                                      .specializzationListShow[index].first,
                                ));
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/ic_search.svg',
                                  ),
                                  (height * 0.02).sbh,
                                  CustomText(
                                      text: controller
                                          .specializzationListShow[index + 4]
                                          .first)
                                ],
                              ),
                            );
                          }),
                        )
                      : const SizedBox();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// izedBox(
//   height: height * 0.2,
//   child: ListView.separated(
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (BuildContext context, int index) {
//       return TextButton(
//         style: ButtonStyle(
//           backgroundColor:
//               MaterialStatePropertyAll(AppColors.blueColor),
//         ),
//         onPressed: () {},
//         child: const Text(''),
//       );
//     },
//     itemCount: 3,
//     separatorBuilder: (BuildContext context, int index) {
//       return SizedBox(
//         width: width * 0.05,
//       );
//     },
//   ),
// ),
// SizedBox(
//   height: height * 0.2,
//   child: GridView.count(
//       crossAxisCount: 4,
//       shrinkWrap: true,
//       childAspectRatio: 0.9,
//       padding: EdgeInsetsDirectional.only(end: width * 0.04),
//       crossAxisSpacing: width * 0.04,
//       mainAxisSpacing: width * 0.04,
//       physics: const NeverScrollableScrollPhysics(),
//       children: List.generate(6, (index) {
//         return InkWell(
//           child: Column(
//             children: [
//               SvgPicture.asset('assets/images/'),
//               const CustomText(text: 'طب بشري')
//             ],
//           ),
//         );
//       })),
// )
