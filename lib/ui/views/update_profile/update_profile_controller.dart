import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/profile.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';

class UpdateProfileController extends GetxController {
  UpdateProfileController({required this.userName,required this.numberPhone});
  String userName;
  String numberPhone;

  TextEditingController userController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future updatePhoto() async{
    UpdateProfileRepositories.updateProfile(name:userController.text ,phone:phoneNumberController.text ).then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: 'الرجاء التأكد من اتصالك بالإنترنيت',
            messageType: MessageType.REJECTED);
      }, (r) {
      });
    });
  }

}
