import 'package:template/core/data/network/network_config.dart';

class ProfileEndPoint {
  static String updateProfile = NetworkConfig.getFullApiRoute('profile/update');
  static String updatePhoto = NetworkConfig.getFullApiRoute('profile/update-photo');
  static String getMyProfile = NetworkConfig.getFullApiRoute('my-profile');
  static String userProfile = NetworkConfig.getFullApiRoute('profile/:uuid');
}
