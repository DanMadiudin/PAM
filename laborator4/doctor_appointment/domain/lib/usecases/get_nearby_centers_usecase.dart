import 'package:domain/entities/nearby_center.dart';
import 'package:domain/repositories/nearby_center_repository.dart';


class GetNearbyCentersUseCase {
  final NearbyCenterRepository repository;

  GetNearbyCentersUseCase(this.repository);

  Future<List<NearbyCenter>> call() async {
    return await repository.getNearbyCenters();
  }
}