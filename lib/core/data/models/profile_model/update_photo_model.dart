class UpdatePhotoModel {
  String? photo;

  UpdatePhotoModel({this.photo});

  UpdatePhotoModel.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    return data;
  }
}
