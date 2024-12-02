import 'package:data/models/nearby_center_model.dart';
import 'package:domain/entities/nearby_center.dart';

class NearbyCenterMapper {
  static NearbyCenter toEntity(NearbyCenterModel model) {
    return NearbyCenter(
      image: model.image ?? 'default_image_url', // Valoare implicită pentru URL
      title: model.title ?? 'Unknown Title', // Valoare implicită pentru titlu
      locationName: model.locationName ?? 'Unknown Location', // Valoare implicită pentru locație
      reviewRate: model.reviewRate ?? 0.0, // Valoare implicită pentru rating
      countReviews: model.countReviews ?? 0, // Valoare implicită pentru numărul de recenzii
      distanceKm: model.distanceKm ?? 0.0, // Valoare implicită pentru distanță în km
      distanceMinutes: model.distanceMinutes ?? 0, // Valoare implicită pentru distanță în minute
    );
  }

  static List<NearbyCenter> toEntityList(List<NearbyCenterModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
