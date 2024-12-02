import 'package:domain/entities/nearby_center.dart';

abstract class NearbyCenterRepository {
  Future<List<NearbyCenter>> getNearbyCenters();
}