
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/models/profile_model/update_profile_model.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import '../../../utilis/network_utilis.dart';

class UpdatePhotoRepositories {
  static Future<Either<String, bool>> updatePhoto(
      {required File photo,}) async {
    try {
      return NetworkUtil.postMultipart(
          method: MultiRequestType.POST,
          url: ProfileEndPoint.updatePhoto,
          files: {
            'photo2':photo.toString(),
          },
          headers: NetworkConfig.getHeaders(
              extraHeaders: {"Content-Type": "multipart/form-data;"},
              needAuth: true,
              type: RequestType.POST))
          .then((respons) {
        CommonResponse<UpdateProfileModel> commonResponse =
        CommonResponse.fromJson(respons);
        if (commonResponse.getstatus && commonResponse.data!.status == true) {
          return Right(commonResponse.getstatus);
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
