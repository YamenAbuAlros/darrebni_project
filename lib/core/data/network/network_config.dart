import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

import '../../utilis/general_util.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';
  // static String BASE_API = 'api/v1/';

  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static Map<String, String> getHeaders(
      {bool? needHost = true,
      bool? needAuth = true,
      required RequestType type,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needHost!) "Host": NetworkUtil.baseUrl,
      if (needAuth!)
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (type != RequestType.GET) "Content-Type": "application/json",
      // if (type is MultiRequestType) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
