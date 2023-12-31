import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

import '../../utilis/general_util.dart';

class NetworkConfig {
  static String BASE_API = '/api/';

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
      // if (needAuth!)"Authorization": "Bearer 7|67tq9HBCoPvaBYw07kxWHjyU7swwJVgupN3kgalg",
      if (needAuth!)
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      // if (needAuth!)"Authorization": "Bearer 4|XgGR6uYKMCFMNEzMolyAe2DZun68yqc1hl6mOOqv",

      if (type != RequestType.GET) "Content-Type": "application/json",
      // if (type is MultiRequestType) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
