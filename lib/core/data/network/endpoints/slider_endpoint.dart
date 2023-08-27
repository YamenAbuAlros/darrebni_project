import 'package:template/core/data/network/network_config.dart';

class SliderEndpoint {
  static String sliderAll = NetworkConfig.getFullApiRoute('slider/all');
  static String getSlider = NetworkConfig.getFullApiRoute('slider/');
  static String createSlider = NetworkConfig.getFullApiRoute('slider/create');
}
