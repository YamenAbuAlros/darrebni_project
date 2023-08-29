class TermModel {
  String? uuid;
  String? name;
  Specialization? specialization;

  TermModel({this.uuid, this.name, this.specialization});

  TermModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    specialization = json['specialization'] != null
        ? Specialization.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['name'] = name;
    if (specialization != null) {
      data['specialization'] = specialization!.toJson();
    }
    return data;
  }
}

class Specialization {
  int? id;
  String? uuid;
  String? name;
  College? college;

  Specialization({this.id, this.uuid, this.name, this.college});

  Specialization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    college =
        json['college'] != null ? College.fromJson(json['college']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    if (college != null) {
      data['college'] = college!.toJson();
    }
    return data;
  }
}

class College {
  int? id;
  String? uuid;
  String? name;
  String? logo;
  Category? category;

  College({this.id, this.uuid, this.name, this.logo, this.category});

  College.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    logo = json['logo'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['logo'] = logo;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? uuid;
  String? name;
  String? logo;

  Category({this.id, this.uuid, this.name, this.logo});

  Category.fromJson(Map<String, dynamic> json) {
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
