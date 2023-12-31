import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          iconName: 'ic_back',
          text: 'الاسئلة المهمة',
          ontap: () {
            Get.back();
          },
        )
      ],
    );
  }
}
