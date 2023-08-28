class SliderModel {
  int? id;
  String? imageUrl;
  String? link;

  SliderModel({this.id, this.imageUrl, this.link});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['link'] = link;
    return data;
  }
}
