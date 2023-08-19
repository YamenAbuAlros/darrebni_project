import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:template/ui/views/main_view/home_view/home_view.dart';
import 'package:template/ui/views/main_view/main_controller.dart';
import 'package:template/ui/views/main_view/notification_view/notification_view.dart';
import 'package:template/ui/views/main_view/profile_view/profile_view.dart';

import 'main_view_widget/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageViewController,
        children: const [
          NotificationView(),
          HomeView(),
          FavoriteView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationWidget(
          bottomNavigationEnum: controller.selected.value,
          onTap: (selectedEnum, pageNumber) {
            controller.animatedToPage(selectedEnum, pageNumber);
          },
        ),
      ),
    );
  }
}
