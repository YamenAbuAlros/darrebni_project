import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/all_categories_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/all_categories_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class AllCollegeRepositories {
  static Future<Either<String, List<AllCollegeModel>>> allCategories() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: AllCategoriesEndPoint.AllCollege,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<AllCollegeModel> resultList = [];
          commonResponse.data['data']['colleges'].forEach(
            (element) {
              resultList.add(AllCollegeModel.fromJson(element));
            },
          );
          return Right(resultList);
        }
        else {
          (commonResponse.data.message);
          return Left(commonResponse.data['message'] ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
