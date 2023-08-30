import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/questions_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/questions_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class QuestionsRepositories {
  static Future<Either<String, List<QuestionModel>>> getAllQuestions() async {
    try {
      return NetworkUtil.sendRequest(
              url: QuestionsEndPoints.allQuestions,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET),
              type: RequestType.GET)
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);

        if (commonResponse.getstatus && commonResponse.data['status'] == true) {
          List<QuestionModel> resultList = [];
          commonResponse.data['data']['questions'].forEach(
            (element) {
              resultList.add(QuestionModel.fromJson(element));
            },
          );
          return Right(resultList);
        } else {
          return Left(commonResponse.data['message'] ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
