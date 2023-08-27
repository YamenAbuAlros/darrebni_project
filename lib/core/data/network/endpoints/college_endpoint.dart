import 'package:template/core/data/network/network_config.dart';

class CollegeEndpoint {
  static String allCollege = NetworkConfig.getFullApiRoute('college/all');
  static String specializationsOfCollege = NetworkConfig.getFullApiRoute('specializations-of-college/');
  static String getCollegeById = NetworkConfig.getFullApiRoute('college/');


}
