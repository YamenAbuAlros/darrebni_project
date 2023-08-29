import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/models/all_categories_and_college_model.dart';
import 'package:template/core/data/repositories/college_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';

import '../../../core/data/models/apis/slider_model.dart';
import '../../../core/data/repositories/slider_repositories.dart';

class MainItController extends GetxController {
  MainItController({required this.collageName, this.materialName = ''});

  RxList<SpecializationsOfCollegeByIdModel> nameOfSpecializations =
      <SpecializationsOfCollegeByIdModel>[].obs;
  String collageName = '';
  String materialName = '';
  RxInt carouselIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  List<SliderModel> allSliderList = <SliderModel>[].obs;
  RxInt indexCarousel = 0.obs;

  List<String> nameList = [
    'مترجمات ',
    'داتا بيز',
    'اوتومات',
    'الشبكات',
    'الذكاء الاصطناعي',
    'قواعد المعطيات',
    'هندسة برمجيات',
    'امن',
    'خوارزميات',
  ];

  @override
  void onInit() {
    getAllSlider();
    specializationsOfCollege();
    super.onInit();
  }

  Future specializationsOfCollege() async {
    await CollegeRepositories.specializationsOfCollege(idOfCollege: 1)
        .then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => specializationsOfCollege());
        }
      }, (r) {
        nameOfSpecializations.clear();
        nameOfSpecializations.addAll(r);
      });
    });
  }

  Future getAllSlider() async {
    await SliderRepositories.allSlider().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => getAllSlider());
        }
      }, (r) {
        allSliderList.addAll(r);
      });
    });
  }
}
