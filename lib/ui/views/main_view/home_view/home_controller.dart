import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/models/all_slider_model.dart';
import 'package:template/core/data/repositories/all_category_reositories.dart';
import 'package:template/core/data/repositories/slider_all_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import '../../../../core/data/repositories/all_college_repositories.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Map<String, List<String>> Colleges22 = {};
  RxList categoriesAllName = [].obs;
  RxList<List<String>> collegesAllName = [
    ['']
  ].obs;
  RxInt selectedNum = 0.obs;
  RxInt gridLength = 6.obs;
  RxInt indexCarousel = 0.obs;
  List<List> specialictionsList = [
    ['طب بشري', 'Dr'],
    ['طب اسنان', 'dentist'],
    ['صيدلة', 'pharmacy'],
    ['تمريض', 'nurs'],
    ['هندسة معلوماتية', 'It'],
    ['هندسة معمارية', 'ARCH']
  ];
  List<List> specializzationListShow = [
    ['طب بشري', 'Dr'],
    ['طب اسنان', 'dentist'],
    ['صيدلة', 'pharmacy'],
    ['تمريض', 'nurs'],
    ['هندسة معلوماتية', 'It'],
    ['هندسة معمارية', 'ARCH']
  ];
  List<AllSliderModel> allSlider=<AllSliderModel>[].obs;

  void changeList(int index) {
    selectedNum.value = index;
    int i = 0;
    specializzationListShow.clear();
    index == 0
        ? specialictionsList.forEach((element) {
            specializzationListShow.add(element);
          })
        : index == 1
            ? specialictionsList.forEach((element) {
                if (i > 3) specializzationListShow.add(element);
                i++;
              })
            : specialictionsList.forEach((element) {
                if (i < 4) {
                  specializzationListShow.add(element);
                }
                i++;
              });
    index == 0
        ? gridLength.value = 6
        : index == 1
            ? gridLength.value = 2
            : gridLength.value = 4;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllSlider();
    super.onInit();
  }

  // Future allCategories() async {
  //   await AllCollegeRepositories.allColleges().then((value) {
  //     value.fold((l) {
  //       CustomShowToast.showMessage(
  //           message: l, messageType: MessageType.REJECTED);
  //     }, (r) {
  //       for (var college in r) {
  //         String nameCategory = college.category!.name!;
  //         String nameColleges = college.name!;
  //         String logoCategory = college.category!.logo!;
  //         String IdCategory = college.category!.id!.toString();
  //         String logoColleges = college.logo!;
  //         if (!Colleges22.containsKey(nameCategory)) {
  //           Colleges22.addAll({
  //             nameCategory: [nameColleges, logoColleges,IdCategory],
  //           });
  //         } else if (Colleges22.containsKey(nameCategory)) {
  //           Colleges22[nameCategory]!.add(nameColleges,);
  //           Colleges22[nameCategory]!.add(logoColleges);
  //           Colleges22[nameCategory]!.add(IdCategory);
  //         }
  //       }
  //       // categoriesAllName.value = Colleges22.keys.toList();
  //       Colleges22.isNotEmpty ? get() : null;
  //     });
  //   });
  // }

  get() {
    Colleges22.values.forEach((element) {
      collegesAllName.add(element);
    });
    Colleges22.keys.forEach((element) {
      categoriesAllName.add(element);
    });
  }

  Future allColleges()async{
    await AllCollegeRepositories.allColleges().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {

      });
    });
  }


  Future allCategories()async{
    await AllCollegeRepositories.allColleges().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {

      });
    });
  }

  Future getAllSlider()async{
    await AllSliderRepositories.allSlider().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        allSlider.addAll(r);
      });
    });
  }


}