import 'package:template/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFullApiRoute('login');

  static String verfiy = NetworkConfig.getFullApiRoute('user/verfiy');

  static String register = NetworkConfig.getFullApiRoute('register');
  // static String register = NetworkConfig.getFullApiRoute('JoinApplication/Create');

  static String forgotpassword =
      NetworkConfig.getFullApiRoute('user/forgotpassword');
}
