class NearbyCenterModel {
  String? image;
  String? title;
  String? locationName;
  double? reviewRate;
  int? countReviews;
  double? distanceKm;
  int? distanceMinutes;

  NearbyCenterModel(
      {this.image,
      this.title,
      this.locationName,
      this.reviewRate,
      this.countReviews,
      this.distanceKm,
      this.distanceMinutes});

  NearbyCenterModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    locationName = json['location_name'];
    reviewRate = json['review_rate'];
    countReviews = json['count_reviews'];
    distanceKm = json['distance_km'];
    distanceMinutes = json['distance_minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['location_name'] = locationName;
    data['review_rate'] = reviewRate;
    data['count_reviews'] = countReviews;
    data['distance_km'] = distanceKm;
    data['distance_minutes'] = distanceMinutes;
    return data;
  }
}
