class QuestionModel {
  String? uuid;
  String? content;
  String? reference;
  College? college;
  Term? term;
  Specialization? specialization;
  List<Answers>? answers;

  QuestionModel(
      {this.uuid,
      this.content,
      this.reference,
      this.college,
      this.term,
      this.specialization,
      this.answers});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    content = json['content'];
    reference = json['reference'];
    college =
        json['college'] != null ? College.fromJson(json['college']) : null;
    term = json['term'] != null ? Term.fromJson(json['term']) : null;
    specialization = json['specialization'] != null
        ? Specialization.fromJson(json['specialization'])
        : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['content'] = content;
    data['reference'] = reference;
    if (college != null) {
      data['college'] = college!.toJson();
    }
    if (term != null) {
      data['term'] = term!.toJson();
    }
    if (specialization != null) {
      data['specialization'] = specialization!.toJson();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
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
  bool? isMaster;

  College(
      {this.id, this.uuid, this.name, this.logo, this.category, this.isMaster});

  College.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    logo = json['logo'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    isMaster = json['is_master'];
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
    data['is_master'] = isMaster;
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

class Term {
  int? id;
  String? uuid;
  String? name;
  Specialization? specialization;

  Term({this.id, this.uuid, this.name, this.specialization});

  Term.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    specialization = json['specialization'] != null
        ? Specialization.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
  bool? isMaster;

  Specialization({this.id, this.uuid, this.name, this.college, this.isMaster});

  Specialization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    college =
        json['college'] != null ? College.fromJson(json['college']) : null;
    isMaster = json['is_master'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    if (college != null) {
      data['college'] = college!.toJson();
    }
    data['is_master'] = isMaster;
    return data;
  }
}

class Answers {
  String? uuid;
  String? content;
  bool? isTrue;

  Answers({this.uuid, this.content, this.isTrue});

  Answers.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    content = json['content'];
    isTrue = json['is_true'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['content'] = content;
    data['is_true'] = isTrue;
    return data;
  }
}
