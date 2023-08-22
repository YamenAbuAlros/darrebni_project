import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/all_categories_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class AllCategoriesRepositories {
  static Future<Either<String,dynamic>> allCategories() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: AllCategoriesEndPoint.allCategories,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data.status == true) {
          return Right(commonResponse.data);
        } else {
          (commonResponse.data.message);
          return Left(commonResponse.data.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
