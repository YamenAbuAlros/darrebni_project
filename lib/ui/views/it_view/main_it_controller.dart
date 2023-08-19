import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainItController extends GetxController {
  MainItController({required this.collageName, this.materialName = ''});
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
}
