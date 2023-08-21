import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/token_info.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/user_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import 'package:template/core/utilis/network_utilis.dart';

class UserRepositoriey {
  Future<Either<String, TokenInfo>> login(
      {required String email, required String password}) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.POST,
              url: UserEndPoints.login,
              body: {"userName": email, "password": password},
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.POST))
          .then((respons) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

 static Future<Either<String, bool>> register({
    required String name,
    required String phone,
    required String college_id,
    // String? photo,
  }) async {
    try {
      return NetworkUtil.postMultipart(
          url: UserEndPoints.register,
          method: MultiRequestType.POST,
          headers: NetworkConfig.getHeaders(
            needAuth: false,
            type: RequestType.POST,
            extraHeaders: {
              "Content-Type":
                  "multipart/form-data;"
            }
          ),
          fields: {
            'name': name,
            'phone': phone,
            "college_id": college_id,
          },
          // files: {
          //   "Photo": photo ?? '',
          // }
          ).then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);

        if (commonResponse.getstatus) {
          return Right(commonResponse.getstatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      }
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
