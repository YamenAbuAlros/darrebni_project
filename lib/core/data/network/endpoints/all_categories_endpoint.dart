import 'package:template/core/data/network/network_config.dart';

class AllCategoriesEndPoint {
  static String AllCollege = NetworkConfig.getFullApiRoute('college/all');
  static String SpecializationsOfCollege = NetworkConfig.getFullApiRoute('specializations-of-college/');

}
