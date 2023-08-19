import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  TextEditingController userController =
      TextEditingController(text: "حلا الدروبي");
  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
