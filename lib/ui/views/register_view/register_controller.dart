import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
