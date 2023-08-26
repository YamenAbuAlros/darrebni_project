import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/models/profile_model/get_myprofle_model.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import '../../../utilis/network_utilis.dart';

class GetMyProfileRepositories {
  static Future<Either<String, GetMyProfileModel>> getMyProfile() async {
    try {
      return NetworkUtil.sendRequest(type: RequestType.GET,
          url: ProfileEndPoint.getMyProfile,
          headers: NetworkConfig.getHeaders(
              needAuth: true,
              type: RequestType.GET))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data!.status == true) {
          return Right(commonResponse.data['data']);
        } else {
          (commonResponse.data!.message);
          return Left(commonResponse.data!.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
