import 'package:flutter/material.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: CustomText(text: 'FavoriteView'),
        )
      ],
    );
  }
}
