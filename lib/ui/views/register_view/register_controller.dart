import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/auth_repositories.dart';
import 'package:template/core/data/repositories/college_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/core/services/base_controller.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:template/ui/views/login_view/login_view.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt colegeId = 0.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxList<List> specializationList = <List>[].obs;
  RxBool isLoading = true.obs;
  @override
  onInit() {
    getAllCollages();
    super.onInit();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: AuthRepositories.register(
                  name: userController.text,
                  phone: phoneController.text,
                  college_id: colegeId.value)
              .then((value) {
        value.fold((l) {
          CustomShowToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
          if (l == 'الرجاء التأكد من الاتصال') {
            Get.back();
          }
        }, (r) {
          Get.to(() => const LoginView());
          // Get.off(const MainView(), transition: Transition.cupertino);
        });
      }));
    } else {}
  }

  Future getAllCollages() async {
    await CollegeRepositories.allColleges().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => getAllCollages());
        }
      }, (r) {
        for (var specializtion in r) {
          List specializ = [
            specializtion.name,
            specializtion.logo,
            specializtion.id
          ];
          specializationList.add(specializ);
        }
        isLoading.value = false;
      });
    });
  }
}
