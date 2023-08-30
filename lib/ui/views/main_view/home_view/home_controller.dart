import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/models/apis/college_model.dart';
import 'package:template/core/data/models/apis/slider_model.dart';
// import 'package:template/core/data/repositories/all_category_reositories.dart';
import 'package:template/core/data/repositories/category_repositories.dart';
import 'package:template/core/data/repositories/college_repositories.dart';
import 'package:template/core/data/repositories/slider_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
// import '../../../../core/data/repositories/all_college_repositories.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Map<String, List<String>> Colleges22 = {};

  RxList categoriesAllName = [].obs;
  RxList<List<String>> collegesAllName = [
    ['']
  ].obs;
  RxInt selectedNum = 0.obs;
  RxInt indexCarousel = 0.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    isLoading.value = true;
    getAllSlider();
    getAllCategories();
    super.onInit();
  }

  List<SliderModel> allSliderList = <SliderModel>[].obs;

  //* to store name of categories
  RxList<List<dynamic>> categoryNameList = [
    [0, "الكل"]
  ].obs;
  //* to store categories will show in HomeView
  RxList<CollegeModel> collegeList = <CollegeModel>[].obs;
  //* to store all categories
  RxList<CollegeModel> allColegeList = <CollegeModel>[].obs;

  void getAllCategories() {
    CategoryRepositories.getAllCategory().then((value) => value.fold((l) {
          CustomShowToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
          if (l == 'الرجاء التأكد من الاتصال') {
            Future.delayed(const Duration(seconds: 5))
                .then((value) => getAllCategories());
          }
        }, (r) {
          for (var element in r) {
            categoryNameList.add([element.id!, element.name!]);
          }
        }));
    getAllCollege();
  }

  void getAllCollege() {
    CollegeRepositories.allColleges().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => getAllCollege());
        }
      }, (r) {
        allColegeList.clear();
        collegeList.clear();
        allColegeList.addAll(r);
        collegeList.addAll(r);
        isLoading.value = false;
      });
    });
  }

  void getCollegesOfCategory(int id) {
    collegeList.clear();
    isLoading.value = true;
    if (id == 0) {
      collegeList.addAll(allColegeList);
      isLoading.value = false;
    } else {
      CollegeRepositories.getColleges(id).then((value) => value.fold((l) {
            CustomShowToast.showMessage(
                message: l, messageType: MessageType.REJECTED);

            if (l == 'الرجاء التأكد من الاتصال') {
              Future.delayed(const Duration(seconds: 5))
                  .then((value) => getCollegesOfCategory(id));
            }
          }, (r) {
            collegeList.addAll(r);
            isLoading.value = false;
          }));
    }
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
