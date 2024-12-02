class NearbyCenter {
  final String image;
  final String title;
  final String locationName;
  final double reviewRate;
  final int countReviews;
  final double distanceKm;
  final int distanceMinutes;

  NearbyCenter({
    required this.image,
    required this.title,
    required this.locationName,
    required this.reviewRate,
    required this.countReviews,
    required this.distanceKm,
    required this.distanceMinutes,
  });

  NearbyCenter.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        title = json['title'],
        locationName = json['location_name'],
        reviewRate = (json['review_rate'] as num).toDouble(),
        countReviews = (json['count_reviews'] as num).toInt(),
        distanceKm = (json['distance_km'] as num).toDouble(),
        distanceMinutes = (json['distance_minutes'] as num).toInt();
}
