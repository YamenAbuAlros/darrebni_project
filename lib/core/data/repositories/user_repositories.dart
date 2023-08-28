import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/token_info.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/user_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import 'package:template/core/utilis/network_utilis.dart';

class UserRepositoriey {
  static Future<Either<String, TokenInfo>> login(
      {required String name, required String code}) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: UserEndPoints.login,
              fields: {"name": name, "code": code}, //"code":'ePx9ekn6Or'
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  needAuth: false,
                  type: RequestType.POST))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);

        if (commonResponse.getstatus && commonResponse.data['status'] == true) {
          return Right(TokenInfo.fromJson(commonResponse.data['data']));
        } else {
          (commonResponse.data['message']);
          return Left(commonResponse.data['message'] ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, bool>> register({
    required String name,
    required String phone,
    required int college_id,

  }) async {
    try {
      return NetworkUtil.postMultipart(
        url: UserEndPoints.register,
        method: MultiRequestType.POST,
        headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.POST,
            extraHeaders: {"Content-Type": "multipart/form-data;"}),
        fields: {
          'name': name,
          'phone': phone,
          "college_id": college_id.toString(),
        },
      ).then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);

        if (commonResponse.getstatus && commonResponse.data['status'] == true) {
          return Right(commonResponse.getstatus);
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
