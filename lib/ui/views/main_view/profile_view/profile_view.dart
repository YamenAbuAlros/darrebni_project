import 'package:flutter/material.dart';

import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_textfield.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        CustomAppBar(iconName: 'ic_profile', text: "الملف الشخصي"),
        // CustomTextField(controller: controller, iconName: iconName)
      ],
    ));
  }
}
