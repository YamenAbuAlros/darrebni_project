import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/all_categories_and_college_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/category_endpoint.dart';
import 'package:template/core/data/network/endpoints/college_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class AllCategoryRepositories {
  static Future<Either<String, List<College>>> allCategory() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: CategoryEndpoint.allCategories,
          headers: NetworkConfig.getHeaders(
              needAuth: false, type: RequestType.GET))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<College> resultList = [];
          commonResponse.data['data']['categories'].forEach(
                (element) {
              resultList.add(College.fromJson(element));
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