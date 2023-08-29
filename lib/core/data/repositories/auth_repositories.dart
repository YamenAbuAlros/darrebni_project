import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/token_info.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/data/network/endpoints/auth_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import 'package:template/core/utilis/network_utilis.dart';

class AuthRepositories {
  static Future<Either<String, TokenInfo>> login(
      {required String name, required String code}) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: AuthEndPoints.login,
              fields: {"name": name, "code": code}, //"code":'ePx9ekn6Or'
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  needAuth: false,
                  type: RequestType.POST))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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

  static Future<Either<String, bool>> logout() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: ProfileEndPoint.logout,
              //"code":'ePx9ekn6Or'
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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

  static Future<Either<String, bool>> register({
    required String name,
    required String phone,
    required int college_id,
  }) async {
    try {
      return NetworkUtil.postMultipart(
        url: AuthEndPoints.register,
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
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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
