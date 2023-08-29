import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/models/update_photo_model.dart';
import 'package:template/core/data/models/update_profile_model.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import '../../utilis/network_utilis.dart';

class ProfileRepositories {
  static Future<Either<String, ProfileRepositories>> getMyProfile() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: ProfileEndPoint.getMyProfile,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.GET))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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

  static Future<Either<String, UpdatePhotoModel>> updatePhoto({
    required File photo,
  }) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: ProfileEndPoint.updatePhoto,
              files: {
                'photo2': photo.toString(),
              },
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  needAuth: true,
                  type: RequestType.POST))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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

  static Future<Either<String, UpdateProfileModel>> updateProfile(
      {required String name, required String phone}) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: ProfileEndPoint.updateProfile,
              fields: {"name": name, "phone": phone}, //"code":'ePx9ekn6Or'
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  needAuth: true,
                  type: RequestType.POST))
          .then((respons) {
        if (respons == null) {
          return const Left('الرجاء التأكد من الاتصال');
        }
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
