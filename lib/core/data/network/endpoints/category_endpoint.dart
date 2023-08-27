import 'package:template/core/data/network/network_config.dart';

class CategoryEndpoint {
  static String allCategories = NetworkConfig.getFullApiRoute('category/all');
  static String showCategory = NetworkConfig.getFullApiRoute('category/');
  static String collegesOfCategory = NetworkConfig.getFullApiRoute('colleges-of-category/');
}
