// class GetMyProfileModel {
//   Profile? profile;

//   GetMyProfileModel({this.profile});

//   GetMyProfileModel.fromJson(Map<String, dynamic> json) {
//     profile =
//         json['profile'] != null ? Profile.fromJson(json['profile']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (profile != null) {
//       data['profile'] = profile!.toJson();
//     }
//     return data;
//   }
// }

class ProfileModel {
  String? uuid;
  String? name;
  String? phone;
  String? photo;

  ProfileModel({this.uuid, this.name, this.phone, this.photo});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    phone = json['phone'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['name'] = name;
    data['phone'] = phone;
    data['photo'] = photo;
    return data;
  }
}
