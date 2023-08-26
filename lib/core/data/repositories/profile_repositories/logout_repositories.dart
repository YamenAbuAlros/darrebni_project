import 'package:dartz/dartz.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/enums/request_type.dart';

import '../../../enums/request_type_multipart.dart';
import '../../../utilis/network_utilis.dart';
import '../../models/common_response.dart';
import '../../network/network_config.dart';

class LogoutRepositories {
  static Future<Either<String, bool>> logout(
      ) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: ProfileEndPoint.logout,
           //"code":'ePx9ekn6Or'
          headers: NetworkConfig.getHeaders(
              needAuth: true,
              type: RequestType.GET ))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(respons);

        if (commonResponse.getstatus && commonResponse.data['status'] == true) {
          return Right(commonResponse.data['status']);
        } else {
          (commonResponse.data['message']);
          return Left(commonResponse.data['message'] ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
