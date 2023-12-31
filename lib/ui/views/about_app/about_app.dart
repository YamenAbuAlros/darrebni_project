import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            iconName: 'ic_back',
            text: 'عن التطبيق',
            ontap: () {
              Get.back();
            },
          ),
          Column(
            children: [SvgPicture.asset('assets/images/about_app.svg')],
          )
        ],
      ),
    );
  }
}
