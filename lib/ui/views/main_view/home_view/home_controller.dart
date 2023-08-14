import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<String> categoriesList = ['الكل', 'الكليات الهندسية', 'الكليات الطبية'];
  RxInt selectedNum = 0.obs;
  RxInt gridLength = 6.obs;
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
}
