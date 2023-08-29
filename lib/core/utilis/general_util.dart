import 'package:get/get.dart';
import 'package:template/core/services/connectivity_service.dart';
import 'package:template/core/utilis/network_utilis.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';
import '../../app/my_app_controller.dart';
import '../../ui/shared/custom_widgets/custom_overalay.dart';
import '../data/repositories/shared_preference_repositories.dart';
import '../enums/connectivity_status.dart';
import '../enums/message_type.dart';

String getFullImageUrl(String url) {
  var splitedString = url.split('Images/');
  return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
}

SharedPreferenceRepositories get storage =>
    Get.find<SharedPreferenceRepositories>();

// CartServices get cartServices => Get.find<CartServices>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

MyAppController get myAppController => Get.find<MyAppController>();

// LocationService get locationService => Get.find<LocationService>();
// NotificationService get notificationService => Get.find<NotificationService>();

//! -- For Launcher --

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

bool checkLogin() {
  if (!storage.isLoggedIn) {
    showCustomAlertDialog();
    return false;
  } else {
    return true;
  }
}

// //^ Here you canuse mode with launchUrl for open in our app or in external app

//   if (await canLaunchUrl(emailLaunchUri)) {
//     launchUrl(emailLaunchUri);
//   } else {
//     CustomShowToast.showMessage(
//         message: 'Could not launch $emailLaunchUri',
//         messageType: MessageType.REJECTED);
//   }
// }

// callwith(String path) async {
//   final Uri callLaunchUri = Uri(
//     scheme: 'tel',
//     path: path,
//   );
//   if (await canLaunchUrl(callLaunchUri)) {
//     launchUrl(callLaunchUri);
//   } else {
//     CustomShowToast.showMessage(
//         message: 'Could not launch $callLaunchUri',
//         messageType: MessageType.REJECTED);
//   }
// }

// Future<void> openUrl(url) async {
//   if (await canLaunchUrl(url)) {
//     launchUrl(url);
//   } else {
//     CustomShowToast.showMessage(
//         message: 'Could not launch $url', messageType: MessageType.REJECTED);
//   }
// }

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;
//!------------------------------------

bool get isOnline =>
    myAppController.connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    myAppController.connectivityStatus == ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline) {
    function();
  } else {
    showNoConnectionMessage();
  }
}

void showNoConnectionMessage() {
  CustomShowToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
