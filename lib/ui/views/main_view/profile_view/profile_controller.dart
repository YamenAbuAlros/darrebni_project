import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/core/enums/image_type.dart';

import '../../../shared/colors.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  bool userChoose = false;
  var sbar;
  XFile? choosedImage;
  XFile? ifchoosedImage;
  var tosendRequest;
  XFile? ifChoose;
  FilePickerResult? result;
////////////////////////////////////////////
  bool isClicked = false;
  var image;

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
              choosedImage = null;
              update();
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
          choosedImage = ifChoose;
          tosendRequest = choosedImage!.path;
        }
        break;
      case ImageType.CAMERA:
        ifChoose = await picker.pickImage(source: ImageSource.camera);
        if (ifChoose != null) {
          choosedImage = ifChoose;
          tosendRequest = choosedImage!.path;
        }
        break;
    }
    update();

    Get.back();
  }
}
