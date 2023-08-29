import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:template/core/data/models/common_response.dart';
import 'package:template/core/data/models/update_profile_model.dart';
import 'package:template/core/data/network/endpoints/profile_endpoints.dart';
import 'package:template/core/data/network/network_config.dart';
import 'package:template/core/enums/request_type.dart';
import 'package:template/core/enums/request_type_multipart.dart';
import '../../utilis/network_utilis.dart';

class UpdateProfileRepositories {
  static Future<Either<String, UpdateProfileModel>> updateProfile(
      {required String name, required String phone}) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: ProfileEndPoint.updateProfile,
              fields: {"name": name, "phone": phone},
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  type: RequestType.POST))
          .then((response) {
        if (response != null) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getstatus &&
              commonResponse.data["status"] == true) {
            return Right(commonResponse.data['data']);
          } else {
            (commonResponse.data!.message);
            return Left(commonResponse.data['message'] ?? '');
          }
        } else {
          return const Left('');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class UpdatePhotoRepositories {
  static Future<Either<String, bool>> updatePhoto({
    required File photo,
  }) async {
    try {
      return NetworkUtil.postMultipart(
              method: MultiRequestType.POST,
              url: ProfileEndPoint.updatePhoto,
              files: {
                'photo2': photo,
              },
              headers: NetworkConfig.getHeaders(
                  extraHeaders: {"Content-Type": "multipart/form-data;"},
                  needAuth: true,
                  type: RequestType.POST))
          .then((response) {
        if (response != null) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getstatus &&
              commonResponse.data["status"] == true) {
            return Right(commonResponse.data["status"]);
          } else {
            (commonResponse.data!.message);
            return Left(commonResponse.data['message'] ?? '');
          }
        } else {
          return const Left('');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class GetMyProfileRepositories {
  static Future<Either<String, Profile>> getMyProfile() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: ProfileEndPoint.getMyProfile,
              headers: NetworkConfig.getHeaders(
                  needAuth: true, type: RequestType.GET))
          .then((response) {
        if (response != null) {
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getstatus &&
              commonResponse.data["status"] == true) {
            Profile result =
                Profile.fromJson(commonResponse.data['data']['profile']);

            return Right(result);
          } else {
            (commonResponse.data!.message);
            return Left(commonResponse.data['message'] ?? '');
          }
        } else {
          return const Left('');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

// if(response!=null){
//
// }
// else{
// return const Left('');
// }
