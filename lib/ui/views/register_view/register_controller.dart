import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/user_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/core/services/base_controller.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:template/ui/views/main_view/main_view.dart';
import '../../../core/data/repositories/all_college_repositories.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt collegeId = 0.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxList<List> specializationList = <List>[].obs;
  RxBool isLoading =true.obs;
  @override
  onInit() {
    // getAllSpecializtions();
    geAllCollage();
    super.onInit();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepositoriey
              .register(
                  name: userController.text,
                  phone: phoneController.text,
                  college_id:collegeId.value)
              .then((value) {
        value.fold(
                (l) {
          CustomShowToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        },
                (r) {
          Get.off(const MainView(), transition: Transition.cupertino);
        });
      }));

    } else {}
  }
  Future geAllCollage() async{
    await AllCollegeRepositories.allColleges().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        for(var specializtion in r){
          List specializ=[specializtion.name,specializtion.logo,specializtion.id];
                     specializationList.add(specializ);
                   }
        isLoading.value=false;
      });
    });
  }

}
