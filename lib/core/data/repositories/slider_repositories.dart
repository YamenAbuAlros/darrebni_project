import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/apis/slider_model.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/network/endpoints/slider_endpoint.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/utilis/network_utilis.dart';

class SliderRepositories {
  static Future<Either<String, List<SliderModel>>> allSlider() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: SliderEndPoint.allSlider,
              headers: NetworkConfig.getHeaders(
                  needAuth: false, type: RequestType.GET))
          .then((respons) {
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data["status"] == true) {
          List<SliderModel> resultList = [];
          commonResponse.data['data']['sliders'].forEach(
            (element) {
              resultList.add(SliderModel.fromJson(element));
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
