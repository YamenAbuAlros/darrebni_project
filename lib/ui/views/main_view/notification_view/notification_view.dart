import 'package:flutter/material.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: CustomText(text: 'NotificationView'),
        )
      ],
    );
  }
}
