class UpdatePhotoModel {
  Data? data;
  bool? status;
  String? message;
  int? statuscode;

  UpdatePhotoModel({this.data, this.status, this.message, this.statuscode});

  UpdatePhotoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    statuscode = json['statuscode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['statuscode'] = this.statuscode;
    return data;
  }
}

class Data {
  String? photo;

  Data({this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    return data;
  }
}
