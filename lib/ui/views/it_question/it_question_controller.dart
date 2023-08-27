import 'package:get/get.dart';

class ItQuestionController extends GetxController{
  ItQuestionController({required this.collageName, this.materialName = '',required this.typeOfQuestion});
  String collageName = '';
  String materialName = '';
  String typeOfQuestion='';
}