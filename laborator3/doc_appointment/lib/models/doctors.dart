class Doctors {
  String? image;
  String? fullName;
  String? typeOfDoctor;
  String? locationOfCenter;
  double? reviewRate;
  int? reviewsCount;
  bool? isFavorite;

  Doctors(
      {this.image,
      this.fullName,
      this.typeOfDoctor,
      this.locationOfCenter,
      this.reviewRate,
      this.reviewsCount});

  Doctors.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    fullName = json['full_name'];
    typeOfDoctor = json['type_of_doctor'];
    locationOfCenter = json['location_of_center'];
    reviewRate = json['review_rate'];
    reviewsCount = json['reviews_count'];
    isFavorite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['full_name'] = fullName;
    data['type_of_doctor'] = typeOfDoctor;
    data['location_of_center'] = locationOfCenter;
    data['review_rate'] = reviewRate;
    data['reviews_count'] = reviewsCount;
    return data;
  }
}
