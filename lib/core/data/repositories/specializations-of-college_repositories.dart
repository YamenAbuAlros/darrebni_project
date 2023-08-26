import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/all_categories_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/models/specializations_of_college_by_id_model.dart';
import 'package:template/core/data/network/endpoints/all_categories_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class SpecializationsOfCollegeByIdRepositories {
  static Future<Either<String, List<SpecializationsOfCollegeByIdModel>>>
      specializationsOfCollege({required idOfCollege}) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: AllCategoriesEndPoint.SpecializationsOfCollege+idOfCollege,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.GET,))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<SpecializationsOfCollegeByIdModel> resultList = [];
          commonResponse.data['data']['specializations'].forEach(
            (element) {
              resultList
                  .add(SpecializationsOfCollegeByIdModel.fromJson(element));
            },
          );
          return Right(resultList);
        } else {
          (commonResponse.data.message);
          return Left(commonResponse.data['message'] ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
