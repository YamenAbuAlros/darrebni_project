import 'package:template/core/data/network/network_config.dart';

class TermEndpoints {
  static String allTerms = NetworkConfig.getFullApiRoute('term/all');

  static String termByUuid = NetworkConfig.getFullApiRoute('term/:');
}
