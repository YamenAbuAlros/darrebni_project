import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/courses_view/courses_controller.dart';

class CoursesView extends StatefulWidget {
  const CoursesView(
      {super.key, required this.collageName, required this.materialName});
  final String collageName;
  final String materialName;

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  late CoursesController controller;
  @override
  void initState() {
    controller =
        Get.put(CoursesController(widget.collageName, widget.materialName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              iconName: 'ic_back',
              ontap: () {
                Get.back();
              },
              text: 'الدورات'),
          Obx(() => controller.allTermList.isNotEmpty
              ? Padding(
                  padding:
                      EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
                  child: Column(
                    children:
                        List.generate(controller.allTermList.length, (index) {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.only(bottom: height * 0.04),
                        child: CustomButton(
                            onPressed: () {
                              controller.allTermList[index].uuid!;
                            },
                            isPrefix: true,
                            selectedChild: true,
                            backgroundColor: index.isEven
                                ? AppColors.mainPurple3
                                : AppColors.mainblue3,
                            text: controller.allTermList[index].name!,
                            textColor: AppColors.maingrey),
                      );
                    }),
                  ),
                )
              : Center(
                  child: SpinKitWave(
                    color: AppColors.mainPurple1,
                  ),
                ))
        ],
      ),
    );
  }
}
