import 'package:template/core/data/network/network_config.dart';

class AuthEndPoints {
  static String login = NetworkConfig.getFullApiRoute('login');

  static String giveCode = NetworkConfig.getFullApiRoute('give-code');

  static String register = NetworkConfig.getFullApiRoute('register');
  // static String register = NetworkConfig.getFullApiRoute('JoinApplication/Create');

  static String forgotpassword =
      NetworkConfig.getFullApiRoute('user/forgotpassword');
}
