import 'package:data/datasource/nearby_center_local_json_datasource.dart';
import 'package:data/mappers/nearby_center_mapper.dart';
import 'package:data/models/nearby_center_model.dart';
import 'package:domain/entities/nearby_center.dart';
import 'package:domain/repositories/nearby_center_repository.dart';

class NearbyCenterRepositoryImpl implements NearbyCenterRepository {
  final NearbyCenterLocalJsonDataSource nearbyCenterDataSource;

  NearbyCenterRepositoryImpl(this.nearbyCenterDataSource);

  @override
  Future<List<NearbyCenter>> getNearbyCenters() async {
    final List<NearbyCenterModel> nearbyCenterModels = await nearbyCenterDataSource.getNearbyCenters();

    return NearbyCenterMapper.toEntityList(nearbyCenterModels);
  }
}
