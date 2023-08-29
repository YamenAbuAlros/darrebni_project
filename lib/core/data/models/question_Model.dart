class QuestionAllModel {
  String? uuid;
  String? content;
  String? reference;
  College? college;
  Term? term;
  Null? specialization;
  List<Answers>? answers;

  QuestionAllModel(
      {this.uuid,
        this.content,
        this.reference,
        this.college,
        this.term,
        this.specialization,
        this.answers});

  QuestionAllModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    content = json['content'];
    reference = json['reference'];
    college =
    json['college'] != null ? new College.fromJson(json['college']) : null;
    term = json['term'] != null ? new Term.fromJson(json['term']) : null;
    specialization = json['specialization'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['content'] = this.content;
    data['reference'] = this.reference;
    if (this.college != null) {
      data['college'] = this.college!.toJson();
    }
    if (this.term != null) {
      data['term'] = this.term!.toJson();
    }
    data['specialization'] = this.specialization;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
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
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['logo'] = this.logo;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class Term {
  String? uuid;
  String? name;
  Specialization? specialization;

  Term({this.uuid, this.name, this.specialization});

  Term.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    specialization = json['specialization'] != null
        ? new Specialization.fromJson(json['specialization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    if (this.specialization != null) {
      data['specialization'] = this.specialization!.toJson();
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
    json['college'] != null ? new College.fromJson(json['college']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    if (this.college != null) {
      data['college'] = this.college!.toJson();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['content'] = this.content;
    data['is_true'] = this.isTrue;
    return data;
  }
}
