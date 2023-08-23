import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/core/utilis/general_util.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:template/ui/views/main_view/main_view.dart';

import '../../../../core/data/repositories/all_categories_repositories.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<String> categoriesList = ['الكل', 'الكليات الهندسية', 'الكليات الطبية'];
  RxList<dynamic> categoryNames = ['الكل'].obs;
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
  allCategories();
    super.onInit();
  }
  Future allCategories() async{
    await AllCategoriesRepositories.allCategories().then((value) {
    value.fold(
    (l) {
    CustomShowToast.showMessage(
    message: l, messageType: MessageType.REJECTED);
    },
    (r) {
      for (var category in r) {
        String name = category['name'];
        categoryNames.add(name);
      }
      // r.data!.categories!.forEach((category) {
      //   String? categoryName = category.name;
      //   categoryNames.add(categoryName!);
      // });
      // r.data!.categories![0].name;
    });
    });
  }
}
