import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // Future.delayed(const Duration(seconds: 4)).then((value) {
    //   if (storage.getFirstLunch()) {
    //     Get.off(() => const IntroView());
    //   } else {
    //     Get.off(() => storage.isLoggedIn ? const MainView() : LandingView());
    //   }
    //   storage.setFirstLunch(false);
    // });
    super.onInit();
  }
}
