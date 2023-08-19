import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  onInit() {
    getAllSpecializtions();
    super.onInit();
  }

  void getAllSpecializtions() {
    NetworkUtil.sendRequest(type: RequestType.GET, url: '/');
  }

  List<String> specializtionList = [
    'الطب البشري',
    'طب الأسنان',
    'كلية الصيدلة',
    'الهندسة  المعلوماتية',
    'الهندسة المعمارية',
    'التمريض'
  ];
  RxString radioValue = ''.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
}
