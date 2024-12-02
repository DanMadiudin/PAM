class Banners {
  String image;
  String title;
  String description;

  Banners({required this.image, required this.title, required this.description});

  Banners.fromJson(Map<String, dynamic> json)
      : image = json["image"],
        title = json["title"],
        description = json["description"];

  Map<String, dynamic> toJson() =>
      {'image': image, 'title': title, 'description': description};
}
