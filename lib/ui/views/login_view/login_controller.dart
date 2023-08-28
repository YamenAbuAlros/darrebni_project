import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/user_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/core/services/base_controller.dart';
import 'package:template/core/utilis/general_util.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:template/ui/views/main_view/main_view.dart';

class LoginController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeLoginController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepositoriey.login(
                  name: userNameController.text, code: codeLoginController.text)
              .then((value) {
        value.fold((l) {
          CustomShowToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setTokenIno(r);
          Get.off(const MainView(), transition: Transition.cupertino);
        });
      }));
    } else {}
  }

  @override
  void onClose() {
    userNameController.clear();
    codeLoginController.clear();
    super.onClose();
  }
}
