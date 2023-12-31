import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/all_categories_and_college_model.dart';
import 'package:template/core/data/models/apis/college_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/college_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class CollegeRepositories {
  static Future<Either<String, List<CollegeModel>>> allColleges() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: CollegeEndpoint.allCollege,
              headers: NetworkConfig.getHeaders(needAuth: false,
                   type: RequestType.GET))
          .then((respons) { if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<CollegeModel> resultList = [];
          commonResponse.data['data']['colleges'].forEach(
            (element) {
              resultList.add(CollegeModel.fromJson(element));
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

  static Future<Either<String, List<CollegeModel>>> getColleges(int id) async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: '${CollegeEndpoint.collegesOfCategory}$id',
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) { if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<CollegeModel> resultList = [];
          commonResponse.data['data']['colleges'].forEach(
            (element) {
              resultList.add(CollegeModel.fromJson(element));
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

   static Future<Either<String, List<SpecializationsOfCollegeByIdModel>>>
      specializationsOfCollege({required idOfCollege}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          url: "${CollegeEndpoint.specializationsOfCollege}$idOfCollege}",
          headers: NetworkConfig.getHeaders(
            type: RequestType.GET,
          )).then((respons) { if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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
