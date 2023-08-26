import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/specializations-of-college_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';

class MainItController extends GetxController {
  MainItController({required this.collageName, this.materialName = ''});

  RxList<String> nameOfSpecializations = [''].obs;
  String collageName = '';
  String materialName = '';
  RxInt carouselIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
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
    // TODO: implement onInit
    SpecializationsOfCollege();
    super.onInit();
  }

  Future  SpecializationsOfCollege() async {
    await SpecializationsOfCollegeByIdRepositories.specializationsOfCollege(
            idOfCollege: 1)
        .then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        nameOfSpecializations.clear();
        for (var specializations in r) {
          nameOfSpecializations.add(specializations.name!);
        }
      });
    });
  }
}
