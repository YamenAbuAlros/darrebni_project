import 'package:flutter/material.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: CustomText(text: 'ProfileView'),
        )
      ],
    );
  }
}