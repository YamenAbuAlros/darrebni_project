import 'dart:io';
import 'package:template/core/services/base_controller.dart';
import 'package:template/core/utilis/general_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/core/data/repositories/profile.dart';
import 'package:template/core/data/repositories/user_repositories.dart';
import 'package:template/core/enums/image_type.dart';
import 'package:template/ui/views/login_view/login_view.dart';
import '../../../../core/data/models/update_profile_model.dart';
import '../../../../core/enums/message_type.dart';
import '../../../shared/colors.dart';
import 'package:cross_file/cross_file.dart';

import '../../../shared/custom_widgets/custom_showtoast.dart';

class ProfileController extends BaseController {
  TextEditingController complaintController = TextEditingController();

  final picker = ImagePicker();
  File? choosedImage;
  XFile? ifChoose;
  List<Profile> myProfile=<Profile>[];
  RxBool isChoosed = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProfile();
    super.onInit();
  }

  void showBottomSheetwithGetX() {
    Get.bottomSheet(
      Wrap(
        children: [
          ListTile(
            onTap: () async {
              await pikFile(ImageType.CAMERA);
            },
            leading: const Icon(Icons.camera_enhance),
            title: const Text("Camera"),
          ),
          ListTile(
            onTap: () async {
              await pikFile(ImageType.GALLERY);
            },
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
          ),
          ListTile(
            onTap: () async {
              updatePhoto();
              Get.back();
            },
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
          ),
        ],
      ),
      backgroundColor: AppColors.mainWhiteColor,
    );
  }

  Future<void> pikFile(ImageType type) async {
    switch (type) {
      case ImageType.GALLERY:
        ifChoose = await picker.pickImage(source: ImageSource.gallery);
        if (ifChoose != null) {
          choosedImage = File(ifChoose!.path);
          updatePhoto();
          isChoosed.value=true;
        }
        break;
      case ImageType.CAMERA:
        ifChoose = await picker.pickImage(source: ImageSource.camera);
        if (ifChoose != null) {
          choosedImage = File(ifChoose!.path);
          updatePhoto();
          isChoosed.value=true;
        }
        break;
    }
    update();

    Get.back();
  }

  void logout() {
    LogoutRepositories.logout().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        if (r) {
          storage.removeToken();
          Get.offAll(LoginView());
        } else {
          CustomShowToast.showMessage(
              message: 'الرجاء التأكد من الأنترنت',
              messageType: MessageType.REJECTED);
        }
      });
    });
  }

  Future updatePhoto() async{
    UpdatePhotoRepositories.updatePhoto(photo: choosedImage!).then((value) {
      value.fold((l) {
        isChoosed.value=true;
        CustomShowToast.showMessage(
            message: 'الرجاء التأكد من اتصالك بالإنترنيت',
            messageType: MessageType.REJECTED);
      }, (r) {
      });
    });
  }

  Future getProfile() async{
   await    GetMyProfileRepositories.getMyProfile().then((value) {
     value.fold((l) {
       isChoosed.value=true;
       CustomShowToast.showMessage(
           message: 'الرجاء التأكد من اتصالك بالإنترنيت',
           messageType: MessageType.REJECTED);
     }, (r) {
       myProfile.add(r);
       choosedImage=File(myProfile[0].photo.toString());
       isChoosed.value=true;
      // storage.setMyProfile();
     });
   });
  }


}
