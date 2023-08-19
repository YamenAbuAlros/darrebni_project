import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController loginController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
