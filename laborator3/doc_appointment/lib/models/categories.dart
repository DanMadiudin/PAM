class Categories {
  String? title;
  String? icon;

  Categories({this.title, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}

