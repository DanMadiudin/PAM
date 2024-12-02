class Banners {
  String? title;
  String? description;
  String? image;

  Banners({this.title, this.description, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

