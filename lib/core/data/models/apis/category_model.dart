class CategoryModel {
  int? id;
  String? uuid;
  String? name;
  String? logo;

  CategoryModel({this.id, this.uuid, this.name, this.logo});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}
