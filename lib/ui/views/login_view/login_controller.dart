import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/services/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController userController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  // void login() {
  //   if (formKey.currentState!.validate()) {
  //     runFullLoadingFutureFunction(
  //         function: UserRepository()
  //             .login(
  //             email: emailController.text, password: passwordController.text)
  //             .then((value) {
  //           value.fold((l) {
  //             CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
  //           }, (r) {
  //             storage.setLoggedIN(true);
  //             storage.setTokenIno(r);
  //             Get.off(const ShoppingPageView(), transition: Transition.cupertino);
  //           });
  //         }));
  //   } else {}
  // }



}
