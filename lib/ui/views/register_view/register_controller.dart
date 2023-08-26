import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/data/repositories/user_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/services/base_controller.dart';
import 'package:template/core/utilis/general_util.dart';
import 'package:template/core/utilis/network_utilis.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:template/ui/views/login_view/login_view.dart';
import 'package:template/ui/views/main_view/main_view.dart';

import '../../../core/data/repositories/category_repositories/all_categories_repositories.dart';


class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString radioValue = ''.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<List> specializationList = [[]].obs;
  RxBool isLodding =true.obs;
  List<String> specializtionList = [
    'الطب البشري',
    'طب الأسنان',
    'كلية الصيدلة',
    'الهندسة  المعلوماتية',
    'الهندسة المعمارية',
    'التمريض'
  ];
  @override
  onInit() {
    // getAllSpecializtions();
    geAllCollage();
    super.onInit();
  }

  // void getAllSpecializtions() {
  //   NetworkUtil.sendRequest(type: RequestType.GET, url: '/');
  // }

  void register() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepositoriey
              .register(
                  name: userController.text,
                  phone: phoneController.text,
                  college_id:1 )
              .then((value) {
        value.fold(
                (l) {
          CustomShowToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        },
                (r) {
          // storage.setSubStatus(true);
          // storage.setTokenIno(r);
          Get.off(const MainView(), transition: Transition.cupertino);
        });
      }));

    } else {}
  }
  Future geAllCollage() async{
    await AllCollegeRepositories.allCategories().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        for(var specializtion in r){
                     specializationList.add([specializtion.name,specializtion.logo]);
                   }
        isLodding.value=false;
          //          // Get.off(const LoginView(), transition: Transition.cupertino);
      });
    });
  }


}
