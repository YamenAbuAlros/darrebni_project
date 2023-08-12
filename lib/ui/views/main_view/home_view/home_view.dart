import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:template/ui/views/main_view/home_view/home_controller.dart';

import '../../../shared/colors.dart';
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
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SvgPicture.asset('assets/images/shapeMaker.svg'),
              Row(
                children: [
                  SvgPicture.asset('assets/images/shapeMaker.svg'),
                  CustomText(
                      text: 'الرئيسية',
                      textcolor: AppColors.mainBlack,
                      fontsize: width * 0.06),
                ],
              )
            ],
          ),
          // CustomTextField(
          //     controller: controller.searchController,
          //     prefixIcon: SvgPicture.asset(
          //       'assets/images/',
          //     )),
          Container(
              decoration: const BoxDecoration(
                  border: Border(right: BorderSide(width: 1))),
              child: const CustomText(text: 'التصنيفات')),

          SizedBox(
            height: height * 0.2,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.blueColor),
                  ),
                  onPressed: () {},
                  child: const Text(''),
                );
              },
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: width * 0.05,
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                childAspectRatio: 0.9,
                padding: EdgeInsetsDirectional.only(end: width * 0.04),
                crossAxisSpacing: width * 0.04,
                mainAxisSpacing: width * 0.04,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  return InkWell(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/images/'),
                        const CustomText(text: 'طب بشري')
                      ],
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
//  CachedNetworkImage(
//                                   height: height * 0.1,
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                   // width: width,

//                                   placeholder: (context, url) =>
//                                       CircularProgressIndicator(
//                                     color: AppColors.mainOrangeColor,
//                                     strokeWidth: 2,
//                                   ),
//                                   imageUrl:
//                                       controller.categoryList[index].image!,
//                                 ),