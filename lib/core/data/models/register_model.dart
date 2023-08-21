class RegisterModel {
  String? data;
  bool? status;
  String? message;
  int? statuscode;

  RegisterModel({this.data, this.status, this.message, this.statuscode});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
    statuscode = json['statuscode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['status'] = this.status;
    data['message'] = this.message;
    data['statuscode'] = this.statuscode;
    return data;
  }
}
