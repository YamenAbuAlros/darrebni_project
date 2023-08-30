import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/term_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/term_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class TermRepositories {
  static Future<Either<String, List<TermModel>>> allTerms() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: TermEndpoints.allTerms,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<TermModel> resultList = [];
          commonResponse.data['data']['term'].forEach(
            (element) {
              resultList.add(TermModel.fromJson(element));
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

   static Future<Either<String, List<TermModel>>> getTermBuUuid() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: TermEndpoints.termByUuid,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<TermModel> resultList = [];
          commonResponse.data['data']['term'].forEach(
            (element) {
              resultList.add(TermModel.fromJson(element));
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
