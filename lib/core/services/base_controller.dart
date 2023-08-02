import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:template/core/enums/operation_type.dart';
import 'package:template/core/enums/request_status.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../utilis/general_util.dart';

class BaseController extends GetxController {
  var status = RequestStatus.DEFAULT.obs;
  var operationType = {
    "CATEGORY": OperationType.NONE,
    "MEAL": OperationType.NONE,
    "NONE": OperationType.NONE
  }.obs;
  set setRequestStatus(RequestStatus value) {
    status.value = value;
  }

  void setOperationType(String key, OperationType value) {
    // ignore: invalid_use_of_protected_member
    operationType.value[key] = value;
  }

  //! From Coach --
  //   void setOperationType(String key, OperationType value) {
  //   operationType.value.add( value);
  // }

  Future runFutuerFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction({
    required Future function,
    OperationType? type = OperationType.NONE,
  }) async {
    checkConnection(() async {
      setRequestStatus = RequestStatus.LOADING;
      setOperationType(type!.name.toString(), type);
      await function;
      setRequestStatus = RequestStatus.DEFAULT;
      setOperationType(type.name.toString(), OperationType.NONE);
    });
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    checkConnection(() async {
      customLoader();

      await function;

      BotToast.closeAllLoading();
    });
  }

  // String? validateEmail(value) {
  //   if (value.isEmpty) {
  //     return 'please enter your email';
  //   }
  //   if (!isEmail(value)) {
  //     return 'please check your email';
  //   }
  //   return null;
  // }

  // String? validatePassword(value) {
  //   if (value.isEmpty) {
  //     return 'please enter your password';
  //   }
  //   if (!isPassword(value)) {
  //     return 'please check your password';
  //   }
  //   return null;
  // }

  String? validateConfirmPassword(value, passwordController) {
    if (value.isEmpty) {
      return 'please confirm your password';
    }
    if (!(value == passwordController.text)) {
      return 'please enter right password';
    }
    return null;
  }

  void exitFromApp() {
    storage.clearPreference();

    storage.setFirstLunch(false);

    exit(0);
  }
}
